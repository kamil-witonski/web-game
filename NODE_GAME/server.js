var express = require('express');
var app = express();
var http = require('http').Server(app);
var io = require('socket.io')(http);
var passport = require('passport');
var session = require('express-session');
var Middleware = require('./Middleware');
var bodyParser = require('body-parser');
var User = require('./models/User');

app.set('view engine', 'ejs');

exports.passport = passport;

require('./passport');
var knex = require('./knex');

app.use( bodyParser.urlencoded({ extended: true }) );
app.use(session({ secret: 'this_is_a_super_secret_session', key: 'sid'}));
app.use(passport.initialize());
app.use(passport.session());

/****** ROUTES *******/

// Serve the index page 
app.get("/", function (req, res) {
  res.render("index");
});

app.get("/aboutus", function (req, res) {
  res.render("aboutus"); 
});

app.get("/game", Middleware.isLoggedIn, function (req, res) {
  res.locals.user = req.session.user;
  res.render("game", {user1: req.session.user}); 
});

app.get("/gdd", function (req, res) {
  res.render("gdd"); 
});

app.get("/inspiration", function (req, res) {
  res.render("inspiration"); 
});

app.get("/contactus", function (req, res) {
  res.render("contactus"); 
});

app.get('/get-map-data', function(req, res) {
  getCurrentLevelData(function(data) {
    res.send({data: data});
  });
});

app.get('/gun-data', function(req, res) {
  getGunData(function(data) {
    res.send({data: data});

  });
});

app.get('/get-user-stats', function(req, res) {
  getUserStats(req.session.user.id, function(data) {

    res.send(data);
  });
});

app.get('/login', function(req, res) {
  res.render("login"); 
});

// console.log(User.generateHash('test123'));
// var currUser;
//authentication routes
app.post('/login', function(req, res, next) {
    passport.authenticate('local-login', function(err, user, info) {
        console.log(info);

        if(err) {
            console.log(err);
            return res.send({status: 'error', message: err});
        }

        if(!user) {
            return res.send({status: 'error', message: info.message});
        }

        // log user in manually
        req.logIn(user, function(err){
            if(err) {
                console.log(err);
                return next(err);
            }

            currUser = req.user[0];

            console.log(req.user);

            //assign user to session
            req.session.user = req.user[0];

            return res.redirect('/game');
        });
    })(req, res, next);
});



/****** END ROUTES ******/

app.use('/public/assets/',express.static(__dirname + '/public/assets'));
app.use('/public/css/',express.static(__dirname + '/public/css'));
app.use('/public/fonts/',express.static(__dirname + '/public/fonts'));
app.use('/public/images/',express.static(__dirname + '/public/images'));
app.use('/public/js/',express.static(__dirname + '/public/js'));
app.use('/public/sound/',express.static(__dirname + '/public/sound'));

// Listen on port 5000
app.set('port', (process.env.PORT || 5000));
http.listen(app.get('port'), function(){
  console.log('listening on port',app.get('port'));
});



var players = {}; //Keeps a table of all players, the key is the socket id
var bullet_array = []; // Keeps track of all the bullets to update them on the server
var levelData = []; //Keeps a track of all the levels that are playable
var currentLevelIndex = 1;

var winConditions = {
  kills: 5,
  time: 10000
};

var isGameOver = false;

// Tell Socket.io to start accepting connections
io.on('connection', function(socket){
	// Listen for a new player trying to connect
	socket.on('new-player',function(state){
		console.log("New player joined with state:",state);
    console.log('logged user');
    console.log(session);

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
    data.owner_id = socket.id; // Attach id of the player to the bullet 

    //if(Math.abs(data.speed_x) > 20 || Math.abs(data.speed_y) > 20){
      //console.log("Player",socket.id,"is cheating!");
    //}
    bullet_array.push(new_bullet);
  });
});


function getGunData(callback) {
  knex('guns').select().then(function(data) {
   
    callback(data);
    // return data;    
  });
}


function getCurrentLevelData(callback) {

    knex('maps').select().where('id', currentLevelIndex).then(function(data) {
      
      var returnData = {
        name: data[0].name,
        tileMapPath: data[0].tile_map,
        tileSet: [
          data[0].tile_set
        ],
        background: data[0].background,
        audioFile: ""
      }


      callback(returnData);
    });
}

function getNextLevel(callback) {
  currentLevelIndex++;


  knex('maps').count('id as CNT').then(function(data) {
    console.log(data[0].CNT);

    var mapCount = data[0].CNT; 

    if(currentLevelIndex > mapCount) {
      currentLevelIndex = 1;
    }


    knex('maps').select().where('id', currentLevelIndex).then(function(data) {
      


      var returnData = {
        name: data[0].name,
        tileMapPath: data[0].tile_map,
        tileSet: [
          data[0].tile_set
        ],
        background: data[0].background,
        audioFile: ""
      }


      callback(returnData);

    });

  });

  // return levelData[currentLevelIndex]
}

function saveMatchData(data, callback) {
  // save actual match data
  var saveData = data;

  knex('matches').insert({
    date: new Date(),
    data: JSON.stringify(data)
  }).then(function() {

    for(sockId in saveData) {

      knex('matchdata').insert({
        date: new Date(),
        kills: saveData[sockId].kills,
        deaths: saveData[sockId].deaths,
        damage:saveData[sockId].damageDelt,
        user_id:saveData[sockId].user_id
      }).then(function() {
        console.log("MATCH DATA ADDED");
      });
      console.log("UPDATED USER");
    }
  });

  //save individual players data like kills deaths and xp

  callback();
}

function getUserStats(userID, callback) {

  knex.raw("SELECT sum(kills) as kills, sum(deaths) as deaths FROM `matchdata` WHERE user_id = ? group by user_id", [userID]).then(function(data) {
    console.log(data);

    callback(data);
  });

  // knex.rav SELECT count(kills) as kills, sum(deaths) as deaths FROM `matchdata` WHERE user_id = 2 group by user_id

}


// Update the bullets 16 times per frame and send updates 
function ServerGameLoop(){
	
	//bullet code
  for(var i=0;i<bullet_array.length;i++){
    var bullet = bullet_array[i];
    bullet.x += bullet.speed_x; 
    bullet.y += bullet.speed_y;
    //bullet.hit = false;
    
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
    //console.log("Player : " + id + " h: " + players[id].health + " DEAD: " + players[id].deaths + " kills: " + players[id].kills);

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


      io.emit('killedBy', killedBy);

      io.emit("dead-respawn", id);
    }

    if(players[id].kills >= winConditions.kills) {
      console.log("Game end load new level");
      //get player data from db for tyhe winner




      var playerData = JSON.parse(JSON.stringify(players));



      //reset player data
      for(var p in players) {

        // playerData[p].kills =players[p].kills = 0;
        // players[p].deaths = 0;
        // players[p].damageDelt = 0;




        players[p].kills = 0;
        players[p].deaths = 0;
        players[p].damageDelt = 0;
        // players[p].kills = 0;
      }

      console.log("PLAYER DATA:::::::::::");
      console.log(playerData);


      saveMatchData(playerData, function() {

        

        //prepare the data for sending
        getNextLevel(function(data) {
          // console.log(data);
        
          var gameEndData = {
            winner: players[id],
            players: playerData,
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
