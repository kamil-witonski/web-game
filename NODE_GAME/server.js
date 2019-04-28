var express = require('express');
var app = express();
var http = require('http').Server(app);
var io = require('socket.io')(http);
var passport = require('passport');
var session = require('express-session');
var Middleware = require('./Middleware');
var bodyParser = require('body-parser');
var User = require('./models/User');
var db = require('./models/db');

//change view engine to ejs
app.set('view engine', 'ejs');

exports.passport = passport;

require('./passport');
//set up session and passport 
app.use( bodyParser.urlencoded({ extended: true }) );
app.use(session({ secret: 'this_is_a_super_secret_session', key: 'sid'}));
app.use(passport.initialize());
app.use(passport.session());

//set up routes
var appRoutes = require('./routes/app');
app.use('/', appRoutes);

//set up static folder
app.use('/public/assets/',express.static(__dirname + '/public/assets'));
app.use('/public/css/',express.static(__dirname + '/public/css'));
app.use('/public/fonts/',express.static(__dirname + '/public/fonts'));
app.use('/public/images/',express.static(__dirname + '/public/images'));
app.use('/public/js/',express.static(__dirname + '/public/js'));
app.use('/public/sound/',express.static(__dirname + '/public/sound'));

// Listen on port 5000
app.set('port', (process.env.PORT || 9000));
http.listen(app.get('port'), function(){
  console.log('listening on port',app.get('port'));
});

//current connected player
var players = {};
var bullet_array = [];

var winConditions = {
  kills: 5,
  time: 10000
};

var isGameOver = false;

// Socket IO setup 
io.on('connection', function(socket){
	// Listen for a new player trying to connect
	socket.on('new-player',function(state){
		//add extra server side properties to keep track of certain stats
    state.kills = 0;
    state.deaths = 0;
    state.health = 100;
    state.damageDelt = 0;

    players[socket.id] = state;

		// Broadcast a signal to everyone containing the updated players list
		io.emit('update-players',players);
	});
  
  // Listen for a disconnection and update our player table 
  socket.on('disconnect',function(state){
    delete players[socket.id];
    io.emit('update-players',players);
  });
  
  // Listen for move events and tell all other clients that something has moved 
  socket.on('move-player',function(position_data){
    if(players[socket.id] == undefined) return; // Happens if the server restarts and a client is still connected 
    players[socket.id].x = position_data.x;  
    players[socket.id].y = position_data.y; 
    players[socket.id].angle = position_data.angle; 
    players[socket.id].dir = position_data.dir; 
    players[socket.id].topOrientY = position_data.topOrientY;
    players[socket.id].topOrientX = position_data.topOrientX;
    players[socket.id].anim = position_data.anim;

    io.emit('update-players',players);
  });

  // Listen for shoot-bullet events and add it to our bullet array
  socket.on('shoot-bullet',function(data){
    if(players[socket.id] == undefined) return;
    var new_bullet = data;
    data.owner_id = socket.id;

    bullet_array.push(new_bullet);
  });
});



// Update the bullets 16 times per frame and send updates 
function ServerGameLoop(){
	
	//bullet code
  for(var i=0;i<bullet_array.length;i++){
    var bullet = bullet_array[i];
    bullet.x += bullet.speed_x; 
    bullet.y += bullet.speed_y;

    // Check if this bullet is close enough to hit any player 
    for(var id in players){
      if(bullet.owner_id != id){
        // And your own bullet shouldn't kill you
        var dx = players[id].x - bullet.x; 
        var dy = players[id].y - bullet.y;
        var dist = Math.sqrt(dx * dx + dy * dy);
        
        //bullet hit
        if(dist < 50){
          io.emit('player-hit',id, bullet); // Tell everyone this player got hit
          bullet.hit = true;

          players[id].health -= bullet.damage;
          players[id].hit_by = bullet.owner_id;

          players[bullet.owner_id].damageDelt += bullet.damage;
        }
      }
    }
    
    // Remove if it goes too far off screen 
    if(bullet.x < -10 || bullet.x > 3000 || bullet.y < -10 || bullet.y > 1000 || bullet.hit){
        bullet_array.splice(i,1);
        i--;
    }
        
  }
  // Tell everyone where all the bullets are by sending the whole array
  io.emit("bullets-update",bullet_array);

  //general loop for non specific things
  for(var id in players) {

    //handle player kills
    if(players[id].health <= 0) {

      //rerset healt & add death to count
      players[id].health = 100;
      players[id].deaths ++;

      //add kill to player who shot the person last
      players[players[id].hit_by].kills++;

      var killed = {
        name: players[id].username,
        by: players[id].hit_by 
      }

      io.emit('killed', killed);

      var killedBy = {
        name: players[players[id].hit_by].username,
        user: id
      }

      //emit messages for kills
      io.emit('killedBy', killedBy);

      io.emit("dead-respawn", id);
    }

    //check if the players have reached the win conditions
    if(players[id].kills >= winConditions.kills) {
      var playerData = JSON.parse(JSON.stringify(players));
      var playerResults = [];

      for(var p in playerData) {
        playerResults.push(playerData[p]);  
      }

      //reset player data
      for(var p in players) {
        players[p].kills = 0;
        players[p].deaths = 0;
        players[p].damageDelt = 0;
      }

      db.saveMatchData(playerData, function() {
        //prepare the data for sending
        db.getNextLevel(function(data) {

          //order the players descending based on kills
          playerResults = playerResults.sort(function(a,b) {
            return b.kills - a.kills
          });

          var gameEndData = {
            winner: players[id],
            players: playerResults,
            level: data
          }

          //for new level we will broad cast mesage of who won, show all highscores and have a 10s countdown before the next level starrts
          io.emit("game-end", gameEndData);
        });
      });
    }
  }
}

setInterval(ServerGameLoop, 16);
