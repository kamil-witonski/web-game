// JavaScript source code for menuState

var menuState = {

    create: function () {

        //Create string for title
        var nameLabel = game.add.text(80, 80, 'Web Game', { font: '25px Arial', fill: '#ffffff' })

        //Create string of instructions
        var startLabel = game.add.text(80, game.world.height-80, 'Press W To Join', { font: '25px Arial', fill: '#ffffff' })

        //Create initate the W key
        var wkey = game.input.keyboard.addKey(Phaser.Keyboard.W);

        //When W key is pressed function is called.
        wkey.onDown.addOnce(this.start, this);
    },

    //Start function
    start: function () {

        //Loads playState
        game.state.start('play');
    },
};

