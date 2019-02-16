Entity = function(game, x,y) {
	console.log("NEW ENTITY");
	Phaser.Sprite.call(this, game, x,y, 'sprite2');

	//this.game = game;

	//game related stuff
	//this.createPlayer(x,y);
	this.health = 100;
	// this.playerSpeed = 120;
	// this.nextFire = 0;
	// this.bulletsFired = 0;

	// this.cursors = this.game.input.keyboard.createCursorKeys();
	//this.spaceBar = this.game.input.keyboard.addKey(Phaser.Keyboard.SPACEBAR);
}

Entity.prototype.takeDamage = function(damage) {
	console.log("taking damage " + damage);
}


Entity.prototype = Object.create(Phaser.Sprite.prototype);
Entity.prototype.constructor = Entity;


// Entity.prototype.createPlayer = function(x,y) {

// 	// this.socket = io();

// 	this.debug = true;

// 	this.game.physics.enable(this, Phaser.Physics.ARCADE);

// 	this.body.collideWorldBounds = true;

// }


// //players own game loop
// Entity.prototype.update = function() {
// 	var playerMovement = 0;
	
// 	console.log('yo wtf');

//  	//player movement
//     this.body.velocity.y = 200;
//     this.body.velocity.x = 0;

//     if(this.cursors.up.isDown) {
// 		console.log("jump");
//       	this.body.velocity.y -= this.playerSpeed;
//       	playerMovement = 1;
//     }
//     else if(this.cursors.down.isDown) {
//       	this.body.velocity.y += this.playerSpeed;
//       	playerMovement = 1;
//     }
//     if(this.cursors.left.isDown) {
//       	this.body.velocity.x -= this.playerSpeed;
//     	playerMovement = 1;
//     }
//     else if(this.cursors.right.isDown) {
//       	this.body.velocity.x += this.playerSpeed;
//       	playerMovement = 1;
//     }
	
// 	console.log(spaceBar);

//     //shoot weapon
//     if(spaceBar.isDown) {
//     	console.log("YEAH BOII");
//      	this.fireWeapon();
//     }

//     console.log('player update');

//     this.socket.emit('move-player', {x: this.x, y: this.y});
// };

// Entity.prototype.fireWeapon = function() {


// 	this.socket.emit('shoot-bullet', {x: 50, y: 50, speed_x: 100, speed_y: 100 });

// 	/*if(this.game.time.now > this.nextFire) {
// 		var fireRate = 1000;

// 		console.log("Fire weapon");

// 		//claculate the next time you can fire weapon
// 		this.nextFire = this.game.time.now + fireRate;

// 		//if all the bullets form the magazine have been used prevent from shooting while reloading
// 		if(this.bulletsFired >= 6) {
// 			this.nextFire = this.game.time.now + 20;

// 			//play reload sound
// 			this.bulletsFired = 0;
// 			return;
// 		}

// 		//create spawn point for bullets where they appear 
// 		var spwanPoint = new Phaser.Point(this.x - this.width / 2 , this.y - this.height / 2 );
// 		spwanPoint.rotate(this.x, this.y, this.rotation);


// 		var mousePoint = {x: game.input.mousePointer.x, y: game.input.mousePointer.y};

		
// 		this.socket.emit('shoot-bullet', {x: 50, y: 50, speed_x: 30, speed_y: 30});
		
// 		//Client.fireGun(spwanPoint, mousePoint);

// 		// //send the bulets into the direction of the pointer
// 		// this.game.physics.arcade.moveToPointer(bullet, this.guns[this.currentGunIndex].bullet_speed);
// 	}	*/
// }