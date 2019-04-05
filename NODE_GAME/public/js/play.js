var dragonBonesPlugin;

// JavaScript source code play
var playState = {
    data: "",
    readyToPLay: false,
    readyToUpdate: false,
    init: function(data) {

        var self = this;

        if(data == undefined) {
            // /get-map-data

            $.ajax({
                type:'GET',
                url: '/get-map-data',
                success: function(data) {
                    console.log(data);
                    self.data = data.data;
                    console.log("New play session");
                    self.readyToPLay = false;
                    self.preLoadMapData();
                }
            });
        } else {

            self.data = data;
            console.log("New play session");
            self.readyToPLay = false;
            self.preLoadMapData();

        }


    },
    preload: function () {
        
    },
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
                // console.log("deed");
            }
        }

        enemySprites.add(enemySprites);

        this.game.world.bringToTop(enemySprites);

        return sprite;
    },
    startLevel: function() {
        this.readyToPLay = true;
        enemySprites = game.add.group();

        console.log("WE HERE?");

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
    },
    update: function() {
        if(!this.readyToPLay) {
            return;
        }

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

                p.bringToTop();
            }
        }
    },
    preLoadMapData: function() {
        //Create loading text
        var loadlingLabel = game.add.text(80, 150, "loading...", { font: "30px Courier", fill: "#ffffff" });

        //add a way of blocking the triggering of the game before the assets have loaded
        console.log(this.data);
        //set what to load
        this.load.tilemap('test_map', this.data.tileMapPath, null, Phaser.Tilemap.TILED_JSON);
        this.load.spritesheet('tileset1', this.data.tileSet[0], 32, 32);
        

        

        //start loading
        this.load.start();



        //wait for load to complete and run the function
        this.load.onLoadComplete.add(this.startLevel, this);
    }
};