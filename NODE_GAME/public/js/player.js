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
    createPlayer: function() {
        this.sprite = game.add.sprite(100 ,100 ,'sprite2');
        this.sprite.anchor.setTo(0.5,0.5);

        //enable physics
        game.physics.enable(this.sprite, Phaser.Physics.ARCADE);

        this.sprite.body.collideWorldBounds = true;
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
            console.log("bullet");
            this.fireWeapon();
        }
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
        if(game.input.keyboard.isDown(Phaser.Keyboard.W) || game.input.keyboard.isDown(Phaser.Keyboard.UP)) {
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
	fireWeapon: function( ) {
		if(game.time.now > this.nextFire) {								
			var fireRate = 200;

			//claculate the next time you can fire weapon
			this.nextFire = game.time.now + fireRate;

			//if all the bullets form the magazine have been used prevent from shooting while reloading
			if(this.bulletsFired >= 6) {
				this.nextFire = game.time.now + 20;

				//play reload sound
				this.bulletsFired = 0;
				return;
			}

			//get the simple bullet implementation going
			var mousePoint = {x: game.input.mousePointer.x, y: game.input.mousePointer.y};
			//figure out the angle from the sprite to the mouse pointer
			var angleToPointer = game.physics.arcade.angleToPointer(this.sprite);
			
			//
			var vel = game.physics.arcade.velocityFromRotation(angleToPointer);
			
			socket.emit('shoot-bullet',{
                x: this.sprite.x, 
                y: this.sprite.y, 
                speed_x: vel.x , 
                speed_y:vel.y,
                damage: 10
            });
		}
	},
    takeDamage: function(damage) {
        console.log("taking damage boii");

        //draw blood or soemthing

        //server handles the damage
        // this.health -= damage;

        // if(this.health <= 0) {
        //     console.log("deed");
        // }
    },
    respawn: function() {
        this.sprite.x = 100;
        this.sprite.y = 100;
        socket.emit('move-player',{x:this.sprite.x,y:this.sprite.y,angle:this.sprite.rotation});
    },
    debugData: function() {
        if(this.debug) {
            game.debug.body(this.sprite);
            game.debug.bodyInfo(this.sprite);
        }
    }
};
