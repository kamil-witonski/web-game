// JavaScript source code for loadState

var gameEnd = {
    data: "",
    init: function(data) {
        this.data = data;
        console.log(data);
    },
    //Load all assets for the menu
    preload: function () {
        //Create loading text
        // var loadlingLabel = game.add.text(80, 140, "display table?...", { font: "30px Courier", fill: "#ffffff" });
        var winner = game.add.text(90, 150, "Winner: " + this.data.winner.user_id, { font: "30px Courier", fill: "#ffffff" });

        this.createTable();
    },
    create: function () {
        console.log("we are in eng game?");

        var selfs = this;
        var count = 30;

        //count down before game restarts
        var timer = setInterval(function() {

            count--;
            if(count == 1) {
                clearInterval(timer);
                //clear players array
                other_players = {};
                game.state.start("play", false, false, selfs.data.level);
            } 
        }, 1000);
    },
    createTable: function() {

        var fontStyle = { font: "20px Courier", fill: "#ffffff" };
        var players = this.data.players;

        game.add.text(200, 180, "POS", fontStyle);
        game.add.text(270, 180, "NAME", fontStyle);
        game.add.text(380, 180, "KILLS", fontStyle);
        game.add.text(470, 180, "DEATHS", fontStyle);
        game.add.text(560, 180, "DAMAGE", fontStyle);
        
        var count = 1;

        var yOffset = 200;

        $.each(players, function(i, player) {
            game.add.text(210, yOffset, count++, fontStyle);
            game.add.text(280, yOffset, "NAME", fontStyle);
            game.add.text(390, yOffset, player.kills, fontStyle);
            game.add.text(480, yOffset, player.deaths, fontStyle);
            game.add.text(570, yOffset, player.damageDelt, fontStyle);

            yOffset += 20;
        });


    }
};

