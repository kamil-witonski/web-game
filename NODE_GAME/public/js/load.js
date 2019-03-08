// JavaScript source code for loadState

var loadState = {
    data: "",
    init: function(data) {
        console.log("WE ARE PRE LOADING DATA");
        this.data = data;

        // this.preloadLevel();
    },
    //all player sprites should be loaded 
    //only load the required assets for the current level
    //use the same key value for the tilemap 

    preload: function() {
        console.log("dasdad asdas");

        this.load.image('sprite', '/public/assets/sprites/sprite.png'); // this will be the sprite of the players
        this.load.image('sprite1', '/public/assets/sprites/sprite1.png');
        this.load.image('sprite2', '/public/assets/sprites/sprite2.png');
        this.load.image('bullet', '/public/assets/sprites/bullet.png');

        console.log("test setsetset");
        this.load.tilemap('test_map', '/public/assets/test_map/test_map.json', null, Phaser.Tilemap.TILED_JSON);
        this.load.spritesheet('tileset1', '/public/assets/test_map/5z1KX.png', 32, 32);
    },
    //Load all assets for the menu
    // preloadLevel: function () {
    //     //Create loading text
    //     var loadlingLabel = game.add.text(80, 150, "loading...", { font: "30px Courier", fill: "#ffffff" });
    //     console.log("OPRE LOAD");
    //     console.log(this.data);


    //     this.load.image('sprite', '/public/assets/sprites/sprite.png'); // this will be the sprite of the players
    //     this.load.image('sprite1', '/public/assets/sprites/sprite1.png');
    //     this.load.image('sprite2', '/public/assets/sprites/sprite2.png');
    //     this.load.image('bullet', '/public/assets/sprites/bullet.png');

    //     if(this.data == undefined) {
    //         console.log("test setsetset");
    //         this.load.tilemap('test_map', '/public/assets/test_map/test_map.json', null, Phaser.Tilemap.TILED_JSON);
    //         this.load.spritesheet('tileset1', '/public/assets/test_map/5z1KX.png', 32, 32);
    //     } else {
    //         //gather level data here
    //         // this.load.tilemap(mapData.tileSetName, mapData.tileSetLocation, null, Phaser.Tilemap.TILED_JSON);

    //         this.load.tilemap('test_map', '/public/assets/test_map/test_map.json', null, Phaser.Tilemap.TILED_JSON);
    //         this.load.spritesheet('tileset1', '/public/assets/test_map/5z1KX.png', 32, 32);

    //         //start loading tilemap
            
    //     }

    //     this.load.start();

    //     this.load.onLoadComplete.add(this.startCreate, this);

    //     console.log('loaded everything');
    // },
    // startCreate: function() {
    //     console.log("going into play");
    //     game.state.start('play');
    // },
    create: function () {
        //if starting first time
        if(this.data == undefined) {
            //Launch Start Menu
            game.state.start("menu");
        } 
    },
};

