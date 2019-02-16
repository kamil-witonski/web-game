var game = new Phaser.Game(30*20, 32*20, Phaser.AUTO, document.getElementById('game'));
var Game = {
	playerMap: []
};

var player;
var groundLayer;
var bullets;


var Client = {};
Client.socket = io.connect();

// Client.askNewPlayer = function(){
//     Client.socket.emit('newplayer');
// };

// Client.socket.on('newplayer', function(data){
//     Game.addNewPlayer(data.id,data.x,data.y);
// });

var currentPlayers = {};



Game.init = function(){
	console.log("sadasd");
    //game.stage.disableVisibilityChange = true;
};

Game.preload = function() {

	console.log("{/dasdasd");
    game.load.tilemap('john', '/public/assets/map/john.json', null, Phaser.Tilemap.TILED_JSON);
    game.load.spritesheet('tileset', '/public/assets/map/5z1KX.png',32,32);
    game.load.image('sprite','/public/assets/sprites/sprite.png'); // this will be the sprite of the players


    game.load.image('sprite1','/public/assets/sprites/sprite1.png');
    game.load.image('sprite2','/public/assets/sprites/sprite2.png');

    this.load.image('bullet', '/public/assets/sprites/bullet.png');
};

Game.create = function(){
	// Game.

	//initialise the maps
    var map = game.add.tilemap('john');
    map.addTilesetImage('tileset'); // tilesheet is the key of the tileset in map's JSON file

    //layer 0 is always the colision layer !!!
    groundLayer = map.createLayer(0);
    console.log(groundLayer);


    //create all the layers attached to the tile map
    var layer;
    for(var i = 1; i < map.layers.length; i++) {
        layer = map.createLayer(i);
    	layer.resizeWorld();
    }
   // layer.inputEnabled = true; // Allows clicking on the map
	
	groundLayer.resizeWorld();

	map.setCollisionByExclusion([], true, groundLayer);
	this.generateBullets();

    // // //create new player?
    // Client.askNewPlayer();


    Client.socket.emit('newplayer');
   

};


Game.generateBullets = function() {
	bullets = this.game.add.group();
	bullets.enableBody = true;
	bullets.physicsBodyType = Phaser.Physics.ARCADE;

	bullets.createMultiple(50, 'bullet');
	bullets.setAll('checkWorldBounds', true);
	bullets.setAll('outOfBoundsKill', true);
};




//main game loop
Game.update = function() {

    //player.update();
    console.log(currentPlayers);

    for(var id in currentPlayers){
        var p = currentPlayers[id];
        console.log("Sdasdas");
        if(p.target_x != undefined){
            console.log("we here");
            p.x += (p.target_x - p.x) * 0.16;
            p.y += (p.target_y - p.y) * 0.16;
            // Intepolate angle while avoiding the positive/negative issue 
            //var angle = p.target_rotation;
            //var dir = (angle - p.rotation) / (Math.PI * 2);
            //dir -= Math.round(dir);
            //dir = dir * Math.PI * 2;
           // p.rotation += dir * 0.16;
        }
    }
}


Game.spawnBulleet = function(data) {
	console.log(data);



	//ensure the bullet only comes from 1 person

	// test

	var bullet = bullets.getFirstDead();
	bullet.scale.set(0.5);
	// bullet.anchor.setTo(0.5,0.5);

	bullet.reset(data.p1.x, data.p1.y);
	bullet.rotation = 90 + 1.5;

	var xVector = (data.p2.x - data.p1.x) * 3;

	var yVector = (data.p2.y - data.p1.y) * 3;


	bullet.body.velocity.setTo(xVector, yVector);

	// game.physics.arcade.moveToPointer(bullet, this.guns[this.currentGunIndex].bullet_speed);
} 



//server code
Game.addNewPlayer = function(id,x,y){
    Game.playerMap[id] = new Entity(game, 50,50, currentPlayers.length); 

   	//add the sprite to the game variable
   	game.add.existing(
		Game.playerMap[id]
	);

    return Game.playerMap[id];
};



Game.removePlayer = function(id){
    Game.playerMap[id].destroy();
    delete Game.playerMap[id];
};


Game.movePlayer = function(id,x,y){

    var player = Game.playerMap[id];
    var distance = Phaser.Math.distance(player.x,player.y,x,y);
    var duration = distance*10;
    var tween = game.add.tween(player);
    tween.to({x:x,y:y}, duration);
    tween.start();
};

Client.socket.on('update_players', function(players) {
    var playersInSession = {};

    for(var pID in players) {

        if(currentPlayers[pID] == undefined && pID !== Client.socket.io) {
            var p = Game.addNewPlayer(pID, players[pID].x, players[pID].y);
            console.log(p);
            currentPlayers[pID] = p;
        }

        playersInSession[pID] = true;

        if(pID !== Client.socket.id) {
            currentPlayers[pID].target_x = players[pID].x;
            currentPlayers[pID].target_y = players[pID].y;
        }

    }

    for(var pID in currentPlayers) {
        if(!playersInSession[pID]) {
            currentPlayers[pID].destroy();
            delete currentPlayers[id];
        }
    }

});

game.state.add('Game',Game);
game.state.start('Game');
