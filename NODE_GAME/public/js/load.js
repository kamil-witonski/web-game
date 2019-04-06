// JavaScript source code for loadState

var loadState = {
    init: function(data) {
        console.log("WE ARE PRE LOADING DATA");
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



        this.load.spritesheet('recruit_legs', '/public/assets/sprites/rec_legs.png', 61, 76);
        this.load.spritesheet('recruit_body', '/public/assets/sprites/rec_body.png', 61, 76);


        this.load.tilemap('test_map', '/public/assets/test_map/test_map.json', null, Phaser.Tilemap.TILED_JSON);
        this.load.spritesheet('tileset1', '/public/assets/test_map/5z1KX.png', 32, 32);
    },
    create: function () {
        game.state.start("menu");
    },
};

