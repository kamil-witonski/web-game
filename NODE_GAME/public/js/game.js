// JavaScript source code for game main

//Set window size
var WINDOW_WIDTH = 1000;
var WINDOW_HEIGHT = 500;

//Create game window
var game = new Phaser.Game(1000, 500, Phaser.WEBGL, 'gameDiv');


//global vars
var groundLayer;
var bullet_array = [];

var socket;
var other_players = {};
var enemySprites;

var currentPlayers = {};
var respawnPoints;

//Add each state
game.state.add('boot', bootState);
game.state.add('load', loadState);
game.state.add('pre-menu', premenuState);
game.state.add('menu', menuState);
game.state.add('play', playState);
game.state.add('game-end', gameEnd);
game.state.add('stats', stats)

//Load boot state
game.state.start('boot');

