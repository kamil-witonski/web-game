var player = {
    sprite:null,//Will hold the sprite when it's created 
    speed_x:0,// This is the speed it's currently moving at
    speed_y:0,
    speed:250,
    friction:0.95,
    shot:false,
    jumpTimer: 0,
    canJump: false,
	nextFire: 0,
    debug: true,
    bulletsFired: 0,
    gunIndex: 0,
    guns: [],
    createPlayer: function() {

        this.sprite = game.add.sprite(100 ,100 ,'sprite2');
        this.sprite.anchor.setTo(0.5,0.5);

        //enable physics
        game.physics.enable(this.sprite, Phaser.Physics.ARCADE);

        this.sprite.body.collideWorldBounds = true;

        this.sprite.bringToTop();
        this.getGunsData();




    },
    update: function(){
        /*
        *
        *Update function for the player, handle all inputs here
        *
        */

        this.debugData();

        //set up colision between player and ground layers
        game.physics.arcade.collide(this.sprite, groundLayer);
        //game.physics.arcade.overlap(this.sprite, groundLayer, function(){}, null, this);

        this.handleMovement();

        if(game.input.activePointer.isDown) {
            this.fireWeapon();
        }

        if(game.input.keyboard.isDown(Phaser.Keyboard.E)) {
            this.gunIndex ++;


            if(this.gunIndex > (this.guns.length - 1)) {
                this.gunIndex = 0;
            }

        }

            // this.gunIndex
    },
    handleMovement: function() {
        /*
        *This code is responsible for handling the player movement
        *
        *
        */

        this.speed_x = 0;
        this.speed_y = 0;

        this.sprite.body.velocity.x = 0;

        // handle jump
        if (game.input.keyboard.isDown(Phaser.Keyboard.W) || game.input.keyboard.isDown(Phaser.Keyboard.UP)) {
            this.jumpTimer += game.time.elapsed;

            //check if we are on the ground and jump initially
            if(this.sprite.body.blocked.down) {
                this.canJump = true;

                this.sprite.body.velocity.y = -250;
            }

            //if we can jump and the key has been held 
            if (this.canJump && this.jumpTimer !== 0) {

                //check how long its been held for
                if(this.jumpTimer > 300) {
                    this.canJump = false;
                    this.jumpTimer = 0;
                }

                //add extra jump for higher jumps
                this.sprite.body.velocity.y = -350;
            }
            //reset everything when we let of the key
        } else {
            this.canJump = false;
            this.jumpTimer = 0;
        }

        if(game.input.keyboard.isDown(Phaser.Keyboard.A) || game.input.keyboard.isDown(Phaser.Keyboard.LEFT)) {
            this.speed_x -= this.speed;
        }

        if(game.input.keyboard.isDown(Phaser.Keyboard.D) || game.input.keyboard.isDown(Phaser.Keyboard.RIGHT)) {
            this.speed_x += this.speed;
        }
        
        //move the actual sprite
        this.sprite.body.velocity.x = this.speed_x;
     
        // Tell the server we've moved 
        socket.emit('move-player',{x:this.sprite.x,y:this.sprite.y,angle:this.sprite.rotation});
    },
    getGunsData: function() {
        var self = this;

        $.ajax({
            type: 'GET',
            url: '/gun-data',
            success:function(data) {
                console.log("GUN DATA");
                console.log(data);

                self.guns = data.data;

                console.log(self.guns);
            }
        });
    },
	fireWeapon: function( ) {




        //the guns will be loaded from back end and the values will be overwritten here to give different specs to guns
        // var reloadTime = 2000;
        // var fireRate = 200;
        // var bulletVelocity = 20;
        // var bulletDamage = 50;
        // var bulletsInMagazine = 10;

        var reloadTime = this.guns[this.gunIndex].reload_time;
        var fireRate = this.guns[this.gunIndex].fire_rate;
        var bulletVelocity = this.guns[this.gunIndex].bullet_velocity;
        var bulletDamage = this.guns[this.gunIndex].bullet_damage;
        var bulletsInMagazine = this.guns[this.gunIndex].mag_size;

		if(game.time.now > this.nextFire) {								
            //claculate the next time you can fire weapon
            this.nextFire = game.time.now + fireRate;

			//if all the bullets form the magazine have been used prevent from shooting while reloading
			if(this.bulletsFired >= bulletsInMagazine) {
				this.nextFire = game.time.now + reloadTime;

				//play reload sound
				this.bulletsFired = 0;
				return;
			}

			//get the simple bullet implementation going
			var mousePoint = {x: game.input.mousePointer.x, y: game.input.mousePointer.y};
			//figure out the angle from the sprite to the mouse pointer
			var angleToPointer = game.physics.arcade.angleToPointer(this.sprite);
			
			//calculate the vector for the bullet path
			var vel = game.physics.arcade.velocityFromRotation(angleToPointer, bulletVelocity);
			
			socket.emit('shoot-bullet',{
                x: this.sprite.x, 
                y: this.sprite.y, 
                speed_x: vel.x , 
                speed_y:vel.y,
                damage: bulletDamage
            });

            this.bulletsFired++;
            // console.log(this.bulletsFired);
		}
	},
    takeDamage: function(damage) {
        console.log("taking damage boii");

        //draw blood or soemthing
    },
    respawn: function() {
        var spawn = respawnPoints[Math.floor(Math.random()*respawnPoints.length)];
        this.sprite.x = spawn.x;
        this.sprite.y = spawn.y;
        socket.emit('move-player',{x:this.sprite.x,y:this.sprite.y,angle:this.sprite.rotation});
    },
    debugData: function() {
        if(this.debug) {
            game.debug.body(this.sprite);
            game.debug.bodyInfo(this.sprite);
        }
    }
};
