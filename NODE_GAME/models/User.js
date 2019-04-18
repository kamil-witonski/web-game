var bcrypt = require('bcrypt-nodejs');
var knex = require('../knex');

var User = {
	table: "users",
	getByUsername: function(username, callback) {
		knex(this.table).where('username', '=', username).select().then(function(result) {
			var err = null;
			callback(result);
		});
	},
	getById: function(userId, callback){
		knex(this.table).where('id', '=', userId).select().then(function(result) {
			callback(result);
		});
	},
	generateHash: function(password) {
		return bcrypt.hashSync(password, bcrypt.genSaltSync(8), null);
	},
	validPassword: function(uPassword, dbPassword) {
		return bcrypt.compareSync(uPassword, dbPassword);
	}
}

module.exports = User;