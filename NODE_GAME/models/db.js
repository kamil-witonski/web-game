var knex = require('../knex');

var levelData = []; //Keeps a track of all the levels that are playable
var currentLevelIndex = 1;

var db = {
  getGunData: function(callback) {
    knex('guns').select().then(function(data) {
      callback(data); 
    });
  },
  getCurrentLevelData: function(callback) {
    knex('maps').select().where('id', currentLevelIndex).then(function(data) { 
      var returnData = {
        name: data[0].name,
        tileMapPath: data[0].tile_map,
        tileSet: [
          data[0].tile_set
        ],
        background: data[0].background,
        audioFile: "",
        spawns: data[0].spawn_points
      }

      callback(returnData);
    });
  },
  getNextLevel: function(callback) {
    currentLevelIndex++;

    knex('maps').count('id as CNT').then(function(data) {
      var mapCount = data[0].CNT; 

      if(currentLevelIndex > mapCount) {
        currentLevelIndex = 1;
      }

      knex('maps').select().where('id', currentLevelIndex).then(function(data) {
        var returnData = {
          name: data[0].name,
          tileMapPath: data[0].tile_map,
          tileSet: [
            data[0].tile_set
          ],
          background: data[0].background,
          audioFile: "",
          spawns: data[0].spawn_points
        }

        callback(returnData);
      });
    });
  },
  saveMatchData: function(data, callback) {
    // save actual match data
    var saveData = data;

    knex('matches').insert({
      date: new Date(),
      data: JSON.stringify(data)
    }).then(function() {

      for(sockId in saveData) {
        //save match data for each player?
        knex('matchdata').insert({
          date: new Date(),
          kills: saveData[sockId].kills,
          deaths: saveData[sockId].deaths,
          damage: saveData[sockId].damageDelt,
          user_id: saveData[sockId].user_id
        }).then(function() {
          console.log("MATCH DATA ADDED");
        });
      }
    });

    //save individual players data like kills deaths and xp

    callback();
  },
  getUserStats: function(userID, callback) {

    knex.raw("SELECT sum(kills) as kills, sum(deaths) as deaths, sum(damage) as damage FROM `matchdata` WHERE user_id = ? group by user_id", [userID]).then(function(data) {
      data = data[0][0];
      data.level = Math.floor(((data.kills * 100) + (data.damage * 0.1) ) / 1000);

      callback(data);
    });
  }
}

module.exports = db;
