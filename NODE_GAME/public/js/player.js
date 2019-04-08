var player = {
    sprite:null,
    speed_x:0,
    speed_y:0,
    speed:250,
    friction:0.95,
    shot:false,
    jumpTimer: 0,
    canJump: false,
    isInAir: false,
	nextFire: 0,
    debug: false,
    bulletsFired: 0,
    gunIndex: 0,
    guns: [],
    topBodyAngle: 0,
    direction: 0,
    topBondOrient: 0,
    animation: '',
    createPlayer: function() {

        // this.sprite = game.add.sprite(100 ,100 ,'sprite2');
        this.sprite = game.add.sprite(100 ,100 ,'recruit_legs');

        //generate the animations from the sprite sheet
        this.sprite.animations.add('idle', [2], 24, true);
        this.sprite.animations.add('run', Phaser.ArrayUtils.numberArray(3, 25), 24, true);
        this.sprite.animations.add('fall', Phaser.ArrayUtils.numberArray(0, 1), 24, true);

        //set up default animation
        this.sprite.animations.play('idle');
        this.animation = 'idle';

        this.sprite.anchor.setTo(0.5,0.5);

        //enable physics
        game.physics.enable(this.sprite, Phaser.Physics.ARCADE);
        this.sprite.body.collideWorldBounds = true;



        //load top part of the body
        this.topSprite = game.add.sprite(0,0, 'recruit_body');
        this.topSprite.anchor.setTo(0.5,0.5);



        this.sprite.addChild(this.topSprite);

        this.topSprite.animations.add('one_hand', [0], 24, true);
        this.topSprite.animations.add('two_hand', [1], 24, true);
        // this.topSprite.animations.play('one_hand');

        this.sprite.bringToTop();

        this.getGunsData();


        //set for pistol
        // var gunsprite = game.add.sprite(20,-12,'pistol_gun');
        // gunsprite.scale.setTo(0.5, 0.5);
        // gunsprite.anchor.setTo(0.5,0.5);
        // this.topSprite.animations.play('one_hand');

        //set up for uzi - need image
        // var gunsprite = game.add.sprite(20,-12,'UZI_gun');
        // gunsprite.scale.setTo(0.5, 0.5);
        // gunsprite.anchor.setTo(0.5,0.5);
        // this.topSprite.animations.play('one_hand');

        // var gunsprite = game.add.sprite(15,-5,'AK47_gun');
        // gunsprite.scale.setTo(0.5, 0.5);
        // gunsprite.anchor.setTo(0.5,0.5);
        // this.topSprite.animations.play('two_hand');



        // this.sprite.children[0].addChild(gunsprite);


        var fireButton = game.input.keyboard.addKey(Phaser.Keyboard.E);
        fireButton.onDown.add(this.changeGun, this);
		ammoText = game.add.text(game.camera.x, game.camera.y, 'Ammo: ', { font: "15px Arial", fill: "#19de65" });
		gunText = game.add.text(game.camera.x, game.camera.y + 15, 'Current Gun: '+ this.gunIndex.name, { font: "15px Arial", fill: "#19de65" });

    },
    update: function(){
        /*
        *
        *Update function for the player, handle all inputs here
        *
        */
		
		this.playerUI();
		
        this.debugData();

        //set up colision between player and ground layers
        game.physics.arcade.collide(this.sprite, groundLayer);
        //game.physics.arcade.overlap(this.sprite, groundLayer, function(){}, null, this);

        this.handleMovement();
        this.handleAnimation();

        if(game.input.activePointer.isDown) {
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
        if (game.input.keyboard.isDown(Phaser.Keyboard.W) || game.input.keyboard.isDown(Phaser.Keyboard.UP)) {
            this.jumpTimer += game.time.elapsed;

            //check if we are on the ground and jump initially
            if(this.sprite.body.blocked.down) {
                this.canJump = true;
                // this.isInAir = false;

                this.sprite.body.velocity.y = -250;
            }

            //if we can jump and the key has been held 
            if (this.canJump && this.jumpTimer !== 0) {
                // this.isInAir = true;
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

        //check if the player is on the ground
        if(this.sprite.body.blocked.down) {
            this.isInAir = false;
        } else {
            this.isInAir = true;
        }
    
        //move the actual sprite
        this.sprite.body.velocity.x = this.speed_x;
     
        // Tell the server we've moved 
        socket.emit('move-player',{
            x:this.sprite.x,
            y:this.sprite.y,
            angle: this.topBodyAngle,
            dir:this.direction,
            topOrient: this.topBondOrient,
            anim: this.animation
        });
    },
    handleAnimation: function() {

        //i fwe are in the air
        if(this.isInAir) {
            this.sprite.animations.play('fall');
            this.animation = 'fall';            
        } else {
            //check the player speed
            if(this.speed_x == 0) {
                this.sprite.animations.play('idle');
                this.animation = 'idle';
            } else {
                this.sprite.animations.play('run');
                this.animation = 'run';
            }    
        }

        var topSpriteOrientation;

        //corectly orient the sprite based on the direction of movement and mouse position
        if (this.speed_x > 0) {
            this.sprite.scale.x = 1;
        } else if(this.speed_x < 0){
            this.sprite.scale.x = -1;
        }


        //rotate correctly rthe top body of the solider
        if(game.input.activePointer.x < this.sprite.x - game.camera.x) {
            // console.log('pointer on left');
            topSpriteOrientation = -1;

        } else {
            // console.log('pointer on right');
            topSpriteOrientation = 1;
        }

        //times the calculated orientation by the current sprite orientation to get the correct direction
        topSpriteOrientation *= this.sprite.scale.x;


        //corectly rotate the player body based on which way the sprite is facing
        if(this.sprite.scale.x < 0) {
            this.topSprite.scale.y = topSpriteOrientation;

            var angle =  Math.atan2(
                (game.input.activePointer.x - (this.sprite.x - game.camera.x)),
                (game.input.activePointer.y - (this.sprite.y - game.camera.y))
            );
                
            angle = angle - 180;

            this.topSprite.rotation = angle;
        } else {
            this.topSprite.scale.y = topSpriteOrientation;

            var angle =  Math.atan2(
                (game.input.activePointer.y - (this.sprite.y - game.camera.y)), 
                (game.input.activePointer.x - (this.sprite.x - game.camera.x))
            );
                
            this.topSprite.rotation = angle;
        }

        this.direction = this.sprite.scale.x;
        this.topBodyAngle = angle;
        this.topBondOrient = topSpriteOrientation;
    },
    changeGun: function() {
        this.gunIndex ++;

        if(this.gunIndex > (this.guns.length - 1)) {
            this.gunIndex = 0;
        }

        //clear the exisitng gun
        this.sprite.children[0].children[0].destroy(true)

        var gun = guns[this.gunIndex];

        var gunOffset = JSON.parse(gun.gun_offset);

        //position the gun where its supposed to be
        var gunsprite = game.add.sprite(gunOffset.x,gunOffset.y, gun.name + '_gun');
        gunsprite.scale.setTo(0.5, 0.5);
        gunsprite.anchor.setTo(0.5,0.5);

        //set the correct animation for the player (one hand or 2 hand)
        this.topSprite.animations.play(gun.animation);
        //add the gun as a child of the top body
        this.sprite.children[0].addChild(gunsprite);
    },
    getGunsData: function() {
        //get gun data from the server

        var self = this;

        $.ajax({
            type: 'GET',
            url: '/gun-data',
            success:function(data) {
                self.guns = data.data;

                //load the initial gun for the player
                var gun = self.guns[self.gunIndex];
                console.log(gun);

                var gunOffset = JSON.parse(gun.gun_offset);

                var gunsprite = game.add.sprite(gunOffset.x,gunOffset.y,'pistol_gun');
                gunsprite.scale.setTo(0.5, 0.5);
                gunsprite.anchor.setTo(0.5,0.5);

                self.topSprite.animations.play(gun.animation);
                self.sprite.children[0].addChild(gunsprite);
            }
        });
    },
	fireWeapon: function( ) {
        var reloadTime = this.guns[this.gunIndex].reload_time;
        var fireRate = this.guns[this.gunIndex].fire_rate;
        var bulletVelocity = this.guns[this.gunIndex].bullet_velocity;
        var bulletDamage = this.guns[this.gunIndex].bullet_damage;
        var bulletsInMagazine = this.guns[this.gunIndex].mag_size;
        var audio = this.guns[this.gunIndex].audio;

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

            //play the gun sound
            game.sound.play(audio);  

            this.bulletsFired++;
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
        socket.emit('move-player',{
            x:this.sprite.x,
            y:this.sprite.y,
            angle: this.topBodyAngle,
            dir:this.direction,
            topOrient: this.topBondOrient,
            anim: this.animation
        });
    },
    debugData: function() {
        if(this.debug) {
            game.debug.body(this.sprite);
            game.debug.bodyInfo(this.sprite);
            game.debug.pointer(game.input.activePointer);
        }
    },
	
	playerUI: function (){
		ammoText.x = game.camera.x;
		ammoText.y = game.camera.y;
		gunText.x = game.camera.x;
		gunText.y = game.camera.y + 15;
		
	},
};
