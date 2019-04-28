var Middleware = {
	isLoggedIn: function(req, res, next) {
	    if(req.isAuthenticated()) {
	    	console.log('logged in');
	        res.locals.isLoggedIn = true;
	        return next();
	    } else {
	    	console.log('NOT LOGGED IN');
	        res.locals.isLoggedIn = false;

	        res.redirect('/login');
	    }
	}
}

module.exports = Middleware;