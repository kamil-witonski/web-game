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
var respawnPoints = [{ x: 100, y: 100 }, { x: 300, y: 300 }];

//Add each state
game.state.add('boot', bootState);
game.state.add('load', loadState);
game.state.add('menu', menuState);
game.state.add('play', playState);
game.state.add('game-end', gameEnd);

//Load boot state
game.state.start('boot');

function create(){
	 var dirtyString = 'The Desyrelâ¢ font doesn\'t have\na trademark character\nor a â¬Euro sign.\nString length: ';

    var text1 = game.add.bitmapText(0, 0, 'desyrel', dirtyString + (dirtyString.length), 32);
}