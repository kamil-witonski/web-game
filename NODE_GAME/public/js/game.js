// JavaScript source code for game main

//Set window size
var WINDOW_WIDTH = 1000;
var WINDOW_HEIGHT = 500;

//Create game window
var game = new Phaser.Game(1000, 500, Phaser.AUTO, 'gameDiv');

//Add each state
game.state.add('boot', bootState);
game.state.add('load', loadState);
game.state.add('menu', menuState);
game.state.add('play', playState);

//Load boot state
game.state.start('boot');
