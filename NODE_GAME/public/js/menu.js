// JavaScript source code for menuState

var menuState = {

    create: function () {
		
		//Background
		game.add.tileSprite(0, 0, 1000, 600, 'menubg');

        //Create string for title
        var nameLabel = game.add.text(80, 80, 'Screen for User account', { font: '25px Arial', fill: '#ffffff' })

        //Create string of instructions
        var startLabel = game.add.text(80, game.world.height-80, 'Log In and Press W to start', { font: '25px Arial', fill: '#ffffff' })
		
		//Create Music
		var music = game.add.audio('menumusic');
		
		//Play Music
		music.play();
		
        //Create initate the W key
        var wkey = game.input.keyboard.addKey(Phaser.Keyboard.W);

        //When W key is pressed function is called.
        wkey.onDown.addOnce(this.start, this,);
    },

    //Start function
    start: function () {
		
		//Stop Music
		//music.stop();

        //Loads playState
        game.state.start('play');
		
    },
};

