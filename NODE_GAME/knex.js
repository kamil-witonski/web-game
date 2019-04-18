//connect to db
var knex = require('knex')({
  client: 'mysql',
  connection: {
    host : '127.0.0.1',
    user : 'root',
    password : 'password123',
    database : 'web_siege'
  }
});

module.exports = knex;