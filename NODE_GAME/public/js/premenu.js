// JavaScript source code for menuState

var premenuState = {

    create: function () {

        //Create string for title
        var nameLabel = game.add.text(80, 80, 'Welcome to Web-Siege, A game by Two Dudes', { font: '25px Arial', fill: '#ffffff' })

        //Create string of instructions
        var startLabel = game.add.text(80, game.world.height-80, 'Press Spacebar To Start', { font: '25px Arial', fill: '#ffffff' })

        //Create initate the W key
        var spacebarkey = game.input.keyboard.addKey(Phaser.Keyboard.SPACEBAR);

        //When W key is pressed function is called.
        spacebarkey.onDown.addOnce(this.start, this);
    },

    //Start function
    start: function () {

        //Loads playState
        game.state.start('menu');
    },
};

