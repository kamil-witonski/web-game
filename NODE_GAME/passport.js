var LocalStrategy = require('passport-local').Strategy;
var App = require('./server');
var passport = App.passport;
var User = require('./models/User');

passport.serializeUser(function(userId, done) {
	done(null, userId);
});

passport.deserializeUser(function(id, done) {
	User.getById(id, function(user) {
		var err = null;
		done(err, user);
	});
});

passport.use('local-signup', new LocalStrategy({
	usernameField : 'username',
	passwordField : 'password',
	passReqToCallback : true
}, function(req, username, password, done){
	process.nextTick(function() {
		User.getByUsername(username, function(user){
			console.log(user);

			//check if the array contains any results
			//if it does means user exists with the specified username and
			//we should redirect back to signup page
			if(username.length < 4) {
				var string = JSON.stringify({'signupMessage': 'Username must be longer than 4 characters.'});

				return done(null, false, {'signupMessage': 'Username must be longer than 4 characters.'});
			} else if (password.length < 4) {
				return done(null, false, {'signupMessage': 'Password must be longer than 4 characters.'});
			} else if(user.length > 0) {
				return done(null, false, {'signupMessage': 'This username is already in use please try a different one.'});
			} else {
				//if usernam doesnt exist create a new user
				var userData = req.body;

				console.log(userData);

				User.createUser(userData, function(newUserId) {
					User.getById(newUserId, function(user) {
						return done(null, user);
					});
				});
			}
		});
	});
}));

//configuration for local-login
passport.use('local-login', new LocalStrategy({
	usernameField: 'username',
	passwordField: 'password',
	passReqToCallback: true
}, function(req, username, password, done) {
	User.getByUsername(username, function(user){
		//check if user has been found in the db
		if(user.length == 0) {
			return done(null, false, {message: "Invalid email or password combination"});
		}

		//check if the password provided by user matches with password in db
		if(!User.validPassword(password, user[0].password)) {
			return done(null, false, {message: "Invalid email or password combination"});
		}

		return done(null, user);
	});
}));