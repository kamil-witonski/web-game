var dragonBonesPlugin;
var isParalax = false;
// JavaScript source code play
var playState = {
    data: "",
    readyToPLay: false,
    readyToUpdate: false,
    paralax: null,
    paralax1: null,
    paralax2: null,
    paralax3: null,
    init: function(data) {

        var self = this;

        if(data == undefined) {
            // /get-map-data

            $.ajax({
                type:'GET',
                url: '/get-map-data',
                success: function(data) {
                    // console.log(data);
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
    CreateLocalPlayer: function (x, y, angle, direction) {


        var sprite = game.add.sprite(x ,y ,'recruit_legs');


      //generate the animations from the sprite sheet
        sprite.animations.add('idle', [2], 24, true);
        sprite.animations.add('run', Phaser.ArrayUtils.numberArray(3, 25), 24, true);
        sprite.animations.add('fall', Phaser.ArrayUtils.numberArray(0, 1), 24, true);

        //set up default animation
        sprite.animations.play('idle');
        

        sprite.anchor.setTo(0.5,0.5);

        //enable physics
        // game.physics.enable(sprite, Phaser.Physics.ARCADE);
        // sprite.body.collideWorldBounds = true;



        //load top part of the body
        var topSprite = game.add.sprite(0,0, 'recruit_body');
        topSprite.anchor.setTo(0.5,0.5);

        sprite.addChild(topSprite);

        topSprite.animations.add('one_hand', [0], 24, true);
        topSprite.animations.add('two_hand', [1], 24, true);
        topSprite.animations.play('two_hand');
  
        sprite.anchor.setTo(0.5, 0.5);
        sprite.health = 100;



        sprite.takeDamage = function (damage) {
            sprite.health -= damage;

            if (sprite.health <= 0) {
                // console.log("deed");
            }
        }

        enemySprites.add(sprite);

        this.game.world.bringToTop(enemySprites);

        return sprite;
    },
    startLevel: function() {
		
		//Change cursor to crosshair on level load?
		this.game.input.useCrosshairCursor = true;
		
        this.readyToPLay = true;
        enemySprites = game.add.group();

        console.log("WE HERE?");

        //initialise the maps
        var map = game.add.tilemap('test_map');
        map.addTilesetImage('test', 'tileset1'); // tilesheet is the key of the tileset in map's JSON file

        if(this.paralax != null) {
            this.paralax.destroy();
        }

        if(this.paralax1 != null) {
            this.paralax1.destroy();
        }

        if(this.paralax2 != null) {
            this.paralax2.destroy();
        }

        if(this.paralax3 != null) {
            this.paralax3.destroy();
        }

		//Sky Image
        this.paralax = game.add.tileSprite(0,0, 3000, 1080, 'paralax_img1');
        // this.paralax1 = game.add.tileSprite(0,0, 3000, 1080, 'paralax_img2');
        this.paralax1 = game.add.tileSprite(0,0, 3000, 1080, 'paralax_img2');
        this.paralax2 = game.add.tileSprite(0,-270, 3000, 1080, 'paralax_img3');
		this.paralax3 = game.add.tileSprite(0,-280, 3000, 1080, 'paralax_img4');

        console.log(game);

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
                //assign values from the server to all the players
                p.x += (p.target_x - p.x);// * 0.16;
                p.y += (p.target_y - p.y);// * 0.16;
                p.scale.x = p.target_dir;
                p.children[0].scale.y = p.target_topOrientY;
                p.children[0].scale.x = p.target_topOrientX;
                p.children[0].rotation = p.target_angle;
                p.animations.play(p.target_anim);

                p.bringToTop();
            }
        }


        //handle paralax		
        if(isParalax) {
            this.paralax1.tilePosition.x += 0.05 * player.direction;
            this.paralax2.tilePosition.x += 0.3 * player.direction;
            
            this.paralax3.tilePosition.x += 0.5 * player.direction;
                
        }
		
    },
    preLoadMapData: function() {
        //Create loading text
        var loadlingLabel = game.add.text(80, 150, "loading...", { font: "30px Courier", fill: "#ffffff" });

        //add a way of blocking the triggering of the game before the assets have loaded
        console.log(this.data);

        console.log(JSON.parse(this.data.background));



        //set what to load
        this.load.tilemap('test_map', this.data.tileMapPath, null, Phaser.Tilemap.TILED_JSON);
        this.load.spritesheet('tileset1', this.data.tileSet[0], 32, 32);
		
        var paralaxBG = JSON.parse(this.data.background);
        var self = this;

        console.log(this.game.image);

        //load all the bg images
        $.each(paralaxBG, function(i, bg) {
            self.load.image('paralax_img' + (i +1), bg, true);
        });

        console.log("fsdfsdfsdf");

        //start loading
        this.load.start();
        //wait for load to complete and run the function
        this.load.onLoadComplete.add(this.startLevel, this);
    }
};