// JavaScript source code for menuState

var stats = {
    data: "",
    init: function() {
        var selfs = this;

        //get data
        $.ajax({
            type:'GET',
            url: '/get-user-stats',
            success: function(data) {
                console.log(data);
                selfs.data = data[0][0];

                selfs.displayData();
            }
        });
    },
    displayData: function() {
        var fontStyle = { font: "20px Courier", fill: "#ffffff" };


        game.add.text(440, 80, "STATS", fontStyle);

        game.add.text(340, 180, "KILLS", fontStyle);
        game.add.text(440, 180, "DEATHS", fontStyle);
        game.add.text(540, 180, "DAMAGE", fontStyle);

        console.log(this.data);

        game.add.text(340, 210, this.data.kills, fontStyle);
        game.add.text(440, 210, this.data.deaths, fontStyle);
        game.add.text(540, 210, this.data.damage, fontStyle);

        game.add.text(350, 400, "PRESS ESC TO RETURN", fontStyle);
    },
    create: function () {

		//display data here




        var ESCkey = game.input.keyboard.addKey(Phaser.Keyboard.ESC);

        ESCkey.onDown.addOnce(function(){
            this.game.state.start('menu');
        }, this);


    },

    //Start function
    start: function () {
		
		//Stop Music
		//music.stop();

        //Loads playState
        game.state.start('play');	
    }
};

