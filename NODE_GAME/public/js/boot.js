// JavaScript source code for bootState

var bootState = {

    create: function () {

        //Enables physics across the game
        game.physics.startSystem(Phaser.Physics.ARCADE);

        //Starts the load state
        game.state.start('load');
    },
};

