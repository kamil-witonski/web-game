// JavaScript source code for bootState

var bootState = {

    create: function () {
    	console.log(game);
        //Enables physics across the game
        game.physics.startSystem(Phaser.Physics.ARCADE);

        //Starts the load state
        game.state.start('load');
    },
};

