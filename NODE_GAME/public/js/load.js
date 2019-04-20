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
		
		//Load backgrounds
		this.load.image('menubg', '/public/images/menubg.png');


        this.load.spritesheet('recruit_legs', '/public/assets/sprites/rec_legs.png', 61, 76);
        this.load.spritesheet('recruit_body', '/public/assets/sprites/rec_body.png', 61, 76);


        this.load.tilemap('test_map', '/public/assets/test_map/test_map.json', null, Phaser.Tilemap.TILED_JSON);
        this.load.spritesheet('tileset1', '/public/assets/test_map/5z1KX.png', 32, 32);

        //load audio for menu music
		this.load.audio('menumusic', ['/public/assets/audio/menumusic.wav']);
		
		//load audio for all guns
        this.load.audio('pistol', ['/public/assets/audio/9mm.mp3']);
        this.load.audio('uzi', ['/public/assets/audio/barreta.mp3']);
        this.load.audio('rifle', ['/public/assets/audio/m4a1.mp3']);
		this.load.audio('sniper', ['/public/assets/audio/sniper.mp3']);
        // this.load.audio('pistol', ['/public/assets/audio/pistol.mp3']);
		
		//I wonder if we can group this data and call it as a whole
		
/* 		//Load level1 (group 1)
		this.load.image('lvl1-sky', '/public/assets/level_1/level1_sky.png');
		this.load.image('lvl1-cloudstr', 'public/assets/level_1/level1_cloudstr.png');
		this.load.image('lvl1-clouds', '/public/assets/level_1/level1_clouds.png');
		this.load.image('lvl1-backtrees', '/public/assets/level1/level_backtrees.png');
		this.load.image('lvl1-trees', '/public/assets/level1/level1_trees.png'); 
		
		//Load level2 (group 2)
		this.load.image('lvl2-sky', '/public/assets/level_2/level2_sky.png');
		this.load.image('lvl2-cloudstr', 'public/assets/level_2/level2_cloudstr.png');
		this.load.image('lvl2-clouds', '/public/assets/level_2/level2_clouds.png');
		this.load.image('lvl2-backtrees', '/public/assets/level_2/level2_backtrees.png');
		this.load.image('lvl2-trees', '/public/assets/level_2/level2_trees.png');
		this.load.image('lvl2-midtrees1', '/public/assets/level_2/level2_midtrees1.png');
		this.load.image('lvl2-midtrees2', '/public/assets/level_2/level2_midtrees2.png');
		
		//Load level3 (group 3)
		this.load.image('lvl3-sky', '/public/assets/level_3/level3_sky.png');
		this.load.image('lvl3-cloudstr', 'public/assets/level_3/level3_cloudstr.png');
		this.load.image('lvl3-trees', '/public/assets/level_3/level3_trees.png');
		this.load.image('lvl3-background', '/public/assets/level_3/level3_background.png');
		this.load.image('lvl3-midground', '/public/assets/level_3/level3_midground.png');
		this.load.image('lvl3-foreground', '/public/assets/level_3/level3_foreground.png');
*/

        //load each gun dynamically for the database
        $.ajax({
            type: 'GET',
            url: '/gun-data',
            success:function(data) {
                self.guns = data.data;

                $.each(data.data, function(i, gun) {
                    console.log(gun.name)
                    game.load.image(gun.name + '_gun', gun.asset_img);

                });
               
            }
        });

    },
    create: function () {
        //add the sounds to be used in game
        this.sound.add('pistol');
        this.sound.add('uzi');
        this.sound.add('rifle');

        game.state.start("pre-menu");
    },
};

