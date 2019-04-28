var player = {
    sprite:null,
    speed_x:0,
    speed_y:0,
    speed:250,
    kills: 0,
    deaths: 0,
    shot:false,
    jumpTimer: 0,
    canJump: false,
    isInAir: false,
	nextFire: 0,
    debug: false,
    totalBulletsFired: 0,
    gunIndex: 0,
    guns: [],
    topBodyAngle: 0,
    direction: 0,
    topBondOrient: 0,
    animation: '',
    ui: {
        killMsgTime: 5,
        ammoText: null,
        gunText: null,
        killText: null,
        gameStats: null
    },
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

        this.sprite.bringToTop();

        this.getGunsData();

        var fireButton = game.input.keyboard.addKey(Phaser.Keyboard.E);
        fireButton.onDown.add(this.changeGun, this);

        this.kills = 0;
        this.deaths = 0;


        this.setupUI();
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

        //enable paralaz flag
        if(this.speed_x != 0) {
            isParalax = true;
        } else {
            isParalax = false;
        }

        // Tell the server we've moved 
        socket.emit('move-player',{
            x:this.sprite.x,
            y:this.sprite.y,
            angle: this.topBodyAngle,
            dir:this.direction,
            topOrientY: this.topBondOrientY,
            topOrientX: this.topBondOrientX,
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

        var topSpriteXOffset;

        //rotate correctly rthe top body of the solider
        if(game.input.activePointer.x < this.sprite.x - game.camera.x) {
            topSpriteOrientation = -1;
            topSpriteXOffset = -1;
        } else {
            topSpriteOrientation = 1;
            topSpriteXOffset = -1;
        }

        //This code somehow works but im not sure how, why, or how long for

        //times the calculated orientation by the current sprite orientation to get the correct direction
        topSpriteOrientation *= this.sprite.scale.x;

        //get the angle of the body based on the position of the sprite and mouse
        var angle =  Math.atan2(
            (game.input.activePointer.y - (this.sprite.y - game.camera.y)), 
            (game.input.activePointer.x - (this.sprite.x - game.camera.x))
        );

        //corectly rotate the player body based on which way the sprite is facing
        if(this.sprite.scale.x < 0) {
            topSpriteOrientation = -topSpriteOrientation
            
            this.topSprite.scale.y = topSpriteOrientation;
            this.topSprite.scale.x = topSpriteXOffset;

            angle *= -1;

        } else {
            topSpriteXOffset = -topSpriteXOffset;
            
            this.topSprite.scale.y = topSpriteOrientation;
            this.topSprite.scale.x = topSpriteXOffset;            
        }

        this.topSprite.rotation = angle;

        this.direction = this.sprite.scale.x;
        this.topBodyAngle = angle;
        this.topBondOrientY = topSpriteOrientation;
        this.topBondOrientX = topSpriteXOffset;
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
        this.nextFire = 0;

        this.updateUI();
    },
    getGunsData: function() {
        //get gun data from the server
        var self = this;

        $.ajax({
            type: 'GET',
            url: '/gun-data',
            success:function(data) {
                self.guns = data.data;

                for(var i =0; i < self.guns.length; i++) {
                    self.guns[i].bullets_fired = 0;
                }

                //load the initial gun for the player
                var gun = self.guns[self.gunIndex];
                var gunOffset = JSON.parse(gun.gun_offset);

                var gunsprite = game.add.sprite(gunOffset.x,gunOffset.y,'pistol_gun');
                gunsprite.scale.setTo(0.5, 0.5);
                gunsprite.anchor.setTo(0.5,0.5);

                self.topSprite.animations.play(gun.animation);
                self.sprite.children[0].addChild(gunsprite);


                self.updateUI();
            }
        });
    },
	fireWeapon: function( ) {

		if(game.time.now > this.nextFire) {								
            //claculate the next time you can fire weapon
            this.nextFire = game.time.now + this.guns[this.gunIndex].fire_rate;

			//if all the bullets form the magazine have been used prevent from shooting while reloading
			if(this.guns[this.gunIndex].bullets_fired >= this.guns[this.gunIndex].mag_size) {
				this.nextFire = game.time.now + this.guns[this.gunIndex].reload_time;


				//play reload sound
				this.guns[this.gunIndex].bullets_fired = 0;

                //play the reload sound
                this.updateUI();
				return;
			}

			//get the simple bullet implementation going
			var mousePoint = {x: game.input.mousePointer.x, y: game.input.mousePointer.y};
			//figure out the angle from the sprite to the mouse pointer
			var angleToPointer = game.physics.arcade.angleToPointer(this.sprite);
			
			//calculate the vector for the bullet path
			var vel = game.physics.arcade.velocityFromRotation(angleToPointer, this.guns[this.gunIndex].bullet_velocity);
			
			socket.emit('shoot-bullet',{
                x: this.sprite.x, 
                y: this.sprite.y, 
                speed_x: vel.x , 
                speed_y:vel.y,
                damage: this.guns[this.gunIndex].bullet_damage,
                gun_audio: this.guns[this.gunIndex].audio 
            });

            this.guns[this.gunIndex].bullets_fired++;
            this.totalBulletsFired++;

            this.updateUI();
		}
	},
    takeDamage: function(damage) {
        // console.log("taking damage boii");

        //draw blood or soemthing
    },
    respawn: function() {
        var spawn = respawnPoints[Math.floor(Math.random()*respawnPoints.length)];

        this.sprite.x = parseInt(spawn.x);
        this.sprite.y = parseInt(spawn.y);

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
    setupUI: function() {

        var uiFont = { font: "15px Arial", fill: "#19de65" };

        // ui_bg
        var uiBG = game.add.sprite(0 ,0 ,'ui_bg');
        uiBG.fixedToCamera = true;

        //set up ui 
        this.ui.ammoText = game.add.text(game.camera.x + 10, game.camera.y + 15, 'Ammo: ', uiFont);
        this.ui.ammoText.fixedToCamera = true;

        this.ui.gunText = game.add.text(game.camera.x + 10, game.camera.y + 30, 'Current Gun: ', uiFont);
        this.ui.gunText.fixedToCamera = true;

        this.ui.gameStats = game.add.text(game.camera.x + 10, game.camera.y + 50, 'Kills: ' + this.kills + " Deaths: " + this.deaths, uiFont);
        this.ui.gameStats.fixedToCamera = true;


        //main kill message
        this.ui.killText = game.add.text(game.camera.x + (game.width / 2) - 100, game.camera.y + 400, '', { font: '30px Arial', fill: '#ff0000' });
        this.ui.killText.fixedToCamera = true;

    },
    updateUI: function() {
        //display the bullet ammount
        this.ui.ammoText.text = "Ammo:" + (this.guns[this.gunIndex].mag_size - this.guns[this.gunIndex].bullets_fired) + "/" + this.guns[this.gunIndex].mag_size;

        //display UI gun text
        this.ui.gunText.text = 'Current Gun: '+ this.guns[this.gunIndex].name;

        this.ui.gameStats.text = 'Kills: ' + this.kills + " Deaths: " + this.deaths;
    },
    displayMessage: function(text) {
        this.updateUI();
        this.ui.killText.text = text;
        this.ui.killMsgTime = 5

        var selfs = this;
        //display message for 5 seconds
        var timer = setInterval(function() {
            selfs.ui.killMsgTime--;

            if(selfs.ui.killMsgTime == 1) {
                clearInterval(timer);
                selfs.ui.killText.text = "";

                selfs.ui.killMsgTime = 5;
            } 
        }, 1000);
    }
};
