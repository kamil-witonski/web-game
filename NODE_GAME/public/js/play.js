// JavaScript source code play




var groundLayer;
var bullet_array = [];

var socket;
var other_players = {};

var currentPlayers = {};
var respawnPoints = [{ x: 100, y: 100 }, { x: 300, y: 300 }];

var playState = {


//this code is responsible for handling the other players on your screen
//so if other player takes damage you will draw blood here for example
//and another on your own player instance in player.js
    CreateLocalPlayer: function (x, y, angle) {
        var sprite = game.add.sprite(x, y, 'sprite1');
        sprite.rotation = angle;
        sprite.anchor.setTo(0.5, 0.5);

        sprite.health = 100;

        sprite.takeDamage = function (damage) {
            sprite.health -= damage;

            if (sprite.health <= 0) {
                console.log("deed");
            }
        }

    // sprite.respawn = function() {

    //     //do something? not sure what tho
    // }

    return sprite;
    },



    create: function() {

    //initialise the maps
        var map = game.add.tilemap('test_map');
        map.addTilesetImage('test', 'tileset1'); // tilesheet is the key of the tileset in map's JSON file

    //layer 0 is always the colision layer !!!
        groundLayer = map.createLayer(0);

    //create all the layers attached to the tile map
        var layer;
        for (var i = 1; i < map.layers.length; i++) {
            layer = map.createLayer(i);
            layer.resizeWorld();
        }

        groundLayer.resizeWorld();

        game.physics.enable(groundLayer, Phaser.Physics.ARCADE);
        groundLayer.body.immovable = true;

        game.stage.disableVisibilityChange = true;
        game.physics.arcade.gravity.y = 500;

        map.setCollisionByExclusion([], true, groundLayer);

        player.createPlayer();

        //make the agem camera follow the player
        game.camera.x = player.sprite.x - WINDOW_WIDTH / 2;
        game.camera.y = player.sprite.y - WINDOW_HEIGHT / 2;

        initialiseClient();

        currentPlayers
    },

    GameLoop: function() {
        player.update();

        // Move camera with player 
        var camera_x = player.sprite.x - WINDOW_WIDTH / 2;
        var camera_y = player.sprite.y - WINDOW_HEIGHT / 2;
        game.camera.x += (camera_x - game.camera.x) * 0.08;
        game.camera.y += (camera_y - game.camera.y) * 0.08;

        // Interpolate all players to where they should be 
        for (var id in other_players) {
            var p = other_players[id];
            if (p.target_x != undefined) {
                p.x += (p.target_x - p.x) * 0.16;
                p.y += (p.target_y - p.y) * 0.16;
            // Intepolate angle while avoiding the positive/negative issue 
                var angle = p.target_rotation;
                var dir = (angle - p.rotation) / (Math.PI * 2);
                dir -= Math.round(dir);
                dir = dir * Math.PI * 2;
                p.rotation += dir * 0.16;
            }
        }
    },
};