
var express = require('express');
var router = express.Router();
var Middleware = require('../Middleware');
var db = require('../models/db');

var App = require('../server');
var passport = App.passport;

/****** ROUTES *******/

// Serve the index page 
router.get("/", function (req, res) {
  res.render("index");
});

router.get("/aboutus", function (req, res) {
  res.render("aboutus"); 
});

router.get("/game", Middleware.isLoggedIn, function (req, res) {
  res.locals.user = req.session.user;
  res.render("game", {user1: req.session.user}); 
});

router.get("/gdd", function (req, res) {
  res.render("gdd"); 
});

router.get("/inspiration", function (req, res) {
  res.render("inspiration"); 
});

router.get("/contactus", function (req, res) {
  res.render("contactus"); 
});

router.get('/get-map-data', function(req, res) {
  db.getCurrentLevelData(function(data) {
    res.send({data: data});
  });
});

router.get('/gun-data', function(req, res) {
  db.getGunData(function(data) {
    res.send({data: data});

  });
});

router.get('/get-user-stats', function(req, res) {
  db.getUserStats(req.session.user.id, function(data) {

    res.send(data);
  });
});

router.get('/login', function(req, res) {
  res.render("login"); 
});

// console.log(User.generateHash('test123'));
// var currUser;
//authentication routes
router.post('/login', function(req, res, next) {
    passport.authenticate('local-login', function(err, user, info) {
        console.log(info);

        if(err) {
            console.log(err);
            return res.send({status: 'error', message: err});
        }

        if(!user) {
            return res.send({status: 'error', message: info.message});
        }

        // log user in manually
        req.logIn(user, function(err){
            if(err) {
                console.log(err);
                return next(err);
            }

            currUser = req.user[0];

            console.log(req.user);

            //assign user to session
            req.session.user = req.user[0];

            return res.redirect('/game');
        });
    })(req, res, next);
});

router.get('/signup', function(req, res) {
  res.render('signup');
});

router.post('/signup', function(req, res, next) {
    passport.authenticate('local-signup', function(err, user, info) {
        console.log(info);

        if(err) {
          console.log(err);
          return res.send({status: 'error', message: info});
        } else if(!user) {
          return res.send({status: 'error', message: info.signupMessage});
        } else {
          return res.redirect('/login');
        }

    })(req, res, next);
});

module.exports = router;