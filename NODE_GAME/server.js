var express = require('express'); // Express contains some boilerplate to for routing and such
var app = express();
var http = require('http').Server(app);
var io = require('socket.io')(http); // Here's where we include socket.io as a node module 

app.set('view engine', 'ejs');


/****** ROUTES *******/

// Serve the index page 
app.get("/", function (req, res) {
  res.render("index");
});

app.get("/aboutus", function (req, res) {
  res.render("aboutus");
  // res.sendFile(__dirname + '/aboutus.html'); 
});

app.get("/game", function (req, res) {
  res.render("game");
  // res.sendFile(__dirname + '/game.html'); 
});

app.get("/gdd", function (req, res) {
  res.render("gdd");
  // res.sendFile(__dirname + '/gdd.html'); 
});

app.get("/inspiration", function (req, res) {
  res.render("inspiration");
  // res.sendFile(__dirname + '/inspiration.html'); 
});

app.get("/contactus", function (req, res) {
  res.render("contactus");
  // res.sendFile(__dirname + '/contactus.html'); 
});

app.get('/get-map-data', function(req, res) {
  getCurrentLevelData(function(data) {
    res.send({data: data});
  });
});

app.get('/gun-data', function(req, res) {
  getGunData(function(data) {


    res.send({data: data});

  })
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

//connect to db
var knex = require('knex')({
  client: 'mysql',
  connection: {
    host : '127.0.0.1',
    user : 'root',
    password : 'password123',
    database : 'web_siege'
  }
});

// knex.select().from('maps').then(function(data) {
//   console.log(data);
// });


var players = {}; //Keeps a table of all players, the key is the socket id
var bullet_array = []; // Keeps track of all the bullets to update them on the server
var levelData = []; //Keeps a track of all the levels that are playable
var currentLevelIndex = 1;

// levelData = [
//   {
//     name: "level1",
//     tileMapPath: "/public/assets/test_map/test_map.json",
//     tileSet: [
//       "/public/assets/test_map/5z1KX.png"
//     ],
//     audioFile: ""
//   },
//   {
//     name: "level2",
//     tileMapPath: "/public/assets/test_map/level2.json",
//     tileSet: [
//       "/public/assets/test_map/5z1KX.png"
//     ],
//     audioFile: ""
//   }
// ];











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

      io.emit("dead-respawn", id);
    }

    if(players[id].kills >= winConditions.kills) {
      console.log("Game end load new level");
      //get player data from db for tyhe winner


      //save all the player kills into db???
      for(var p in players) {
        players[p].kills = 0;
      }

      //prepare the data for sending
      getNextLevel(function(data) {
        console.log(data);
      
        var gameEndData = {
          winner: players[id],
          players: players,
          level: data
        }

        //for new level we will broad cast mesage of who won, show all highscores and have a 10s countdown before the next level starrts
        io.emit("game-end", gameEndData);
      });
    }
  }
}

setInterval(ServerGameLoop, 16);
