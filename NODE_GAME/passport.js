var LocalStrategy = require('passport-local').Strategy;
// var User = require('./models/User');
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
			//check if the array contains any results
			//if it does means user exists with the specified email and
			//we should redirect back to signup page
			if(user.length > 0) {
				return done(null, false, req.flash('signupMessage', 'This email is already in use please try a different one.'));
			} else {
				//if email doesnt exist create a new user
				var userData = req.body;

				userData['company_id'] = null;
				userData['crm_user_id'] = null;
				userData['user_type'] = 2;

				User.createUser(1, userData, function(newUserId) {
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

	console.log('local login');

	User.getByUsername(username, function(user){
		//check if user has been found in the db
		if(user.length == 0) {
			return done(null, false, {message: "Invalid email or password combination"});
		}

		//check if the password provided by user matches with password in db
		if(!User.validPassword(password, user[0].password)) {
			return done(null, false, {message: "Invalid email or password combination"});
		}

		// User.getCompanyDetails(user[0].id, function(result){


		// 	if(result[0].active == 0) {
		// 		return done(null, false, {message:'The company associated with this account is no longer active, please contact admin support'}, req.flash('loginMessage', 'Company not active'));
		// 	}


			return done(null, user);
		// });
	});
}));