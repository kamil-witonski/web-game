// JavaScript source code for menuState
var music;
var menuState = {

    create: function () {
		//Background
		game.add.tileSprite(0, 0, 1000, 600, 'menubg');

        //Create string for title
        var nameLabel = game.add.text(80, 80, 'Web Siege', { font: '25px Arial', fill: '#ffffff' })

        //Create string of instructions
        var test = game.add.text(80, 370, 'Press W to join game', { font: '25px Arial', fill: '#ffffff' })
        var test1 = game.add.text(80, 400, 'Press S for stats', { font: '25px Arial', fill: '#ffffff' })
		

		//Create Music
		music = game.add.audio('menumusic');
		
		//Set Volume
		music.volume = 0.1; 
		
		//Play Music
		music.play();

        var skey = game.input.keyboard.addKey(Phaser.Keyboard.S);

        skey.onDown.addOnce(this.showStats, this);

        //Create initate the W key
        var wkey = game.input.keyboard.addKey(Phaser.Keyboard.W);

        //When W key is pressed function is called.
        wkey.onDown.addOnce(this.start, this);
    },

    //Start function
    start: function () {
		
		//Stop Music
		music.stop();

        //Loads playState
        game.state.start('play');
		
    },
    showStats: function() {
        game.state.start('stats');
    }
};

