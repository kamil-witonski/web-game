// JavaScript source code for loadState

var loadState = {


    //Load all assets
    preload: function () {


        //Create loading text
        var loadlingLabel = game.add.text(80, 150, "loading...", { font: "30px Courier", fill: "#ffffff" });

        game.load.tilemap('test_map', '/public/assets/test_map/test_map.json', null, Phaser.Tilemap.TILED_JSON);
        game.load.spritesheet('tileset1', '/public/assets/test_map/5z1KX.png', 32, 32);
        game.load.image('sprite', '/public/assets/sprites/sprite.png'); // this will be the sprite of the players
        game.load.image('sprite1', '/public/assets/sprites/sprite1.png');
        game.load.image('sprite2', '/public/assets/sprites/sprite2.png');
        this.load.image('bullet', '/public/assets/sprites/bullet.png');
    },

    create: function () {

        //Launch Start Menu
        game.state.start("menu");
    },
};

