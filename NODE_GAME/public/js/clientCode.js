function initialiseClient() {
  //create multiplayer link

  if(socket == undefined) {
    socket = io(); // This triggers the 'connection' event on the server
    socket.emit('new-player',{x:player.sprite.x,y:player.sprite.y,angle:player.sprite.rotation,type:1})
  }

  console.log(socket);

  // Listen for other players connecting
  socket.on('update-players',function(players_data){
      var players_found = {};

      // Loop over all the player data received
      for(var id in players_data){
          // If the player hasn't been created yet
          if(other_players[id] == undefined && id != socket.id){ // Make sure you don't create yourself
              var data = players_data[id];
              var p = playState.CreateLocalPlayer(data.x,data.y,data.angle);
              other_players[id] = p;
              //enemySprites.add(p);
              console.log("Created new player at (" + data.x + ", " + data.y + ")");
          }
          players_found[id] = true;
          
          // Update positions of other players 
          if(id != socket.id){
            other_players[id].target_x  = players_data[id].x; // Update target, not actual position, so we can interpolate
            other_players[id].target_y  = players_data[id].y;
            other_players[id].target_angle  = players_data[id].angle;
            other_players[id].target_dir  = players_data[id].dir;
            other_players[id].target_topOrient  = players_data[id].topOrient;
            other_players[id].target_anim  = players_data[id].anim;
          }
      }

      // Check if a player is missing and delete them 
      for(var id in other_players){
          if(!players_found[id]){
              other_players[id].destroy();
              delete other_players[id];
          }
      }
  });

  // Listen for bullet update events 
  socket.on('bullets-update',function(server_bullet_array){

    // If there's not enough bullets on the client, create them
   for(var i=0;i<server_bullet_array.length;i++){
        if(bullet_array[i] == undefined){
            var bullet = game.add.sprite(server_bullet_array[i].x,server_bullet_array[i].y,'bullet');
            bullet.scale.setTo(0.5,0.5);

            bullet_array[i] = bullet;
        } else {
            //Otherwise, just update it! 
            bullet_array[i].x = server_bullet_array[i].x; 
            bullet_array[i].y = server_bullet_array[i].y;
        }
    }
    // Otherwise if there's too many, delete the extra 
    for(var i=server_bullet_array.length;i<bullet_array.length;i++){
         bullet_array[i].destroy();
         bullet_array.splice(i,1);
         i--;
     }
    
  });



  // Listen for any player hit events and make that player flash 
  socket.on('player-hit',function(id, bullet){
    var entity;
      if(id == socket.id){
          //If this is you
          entity = player;
      } else {
          // Find the right player 
          entity = other_players[id]
      }

      //both checks are necessary if you want to display the necessary data for all players

      // entity.alpha = 0;
      entity.takeDamage(10);

  });

  socket.on("dead-respawn", function(id) {
    if(id == socket.id){
        //If this is you
        player.respawn();
    } 
  });

  socket.on("game-end", function(data) {
    game.state.start('game-end', false, false, data);
  });
}

