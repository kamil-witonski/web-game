// var Client = {};
// Client.socket = io.connect();

// Client.askNewPlayer = function(){
//     Client.socket.emit('newplayer');
// };

// // Client.socket.on('newplayer', function(data){
// //     Game.addNewPlayer(data.id,data.x,data.y);
// // });

// var currentPlayers = {};

// Client.socket.on('update_players', function(players) {
//     var playersInSession = {};

//     for(var pID in players) {

//         if(currentPlayers[pID] == undefined && pID !== Client.socket.io) {
//             var p = Game.addNewPlayer(pID, players[pID].x, players[pID].y);
//             console.log(p);
//             currentPlayers[pID] = p;
//         }

//         playersInSession[pID] = true;
    
//         if(pID !== Client.socket.id) {
//             currentPlayers[pID].target_x = players[pID].x;
//             currentPlayers[pID].target_y = players[pID].y;
//         }

//     }

//     for(var pID in currentPlayers) {
//         if(!playersInSession[pID]) {
//             currentPlayers[pID].destroy();
//             delete currentPlayers[id];
//         }
//     }

// });



// //hooks for recieveing data from the server
// Client.socket.on('remove', function(id){
//     Game.removePlayer(id);
// });

// // Client.socket.on('move', function(data){
// //     Game.movePlayer(data.id,data.x,data.y);
// // });

// Client.socket.on('game_spawnBullet', function(data) {
// 	Game.spawnBulleet(data);
// });




// //hook for sending data to the server
// Client.fireGun = function(playerPos, mousePos) {
// 	Client.socket.emit('fireGun', {p1: playerPos, p2: mousePos});
// }

// Client.sendClick = function(x,y){
//   Client.socket.emit('click',{x:x,y:y});
// };