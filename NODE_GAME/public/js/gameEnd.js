// JavaScript source code for loadState
// var countdown;
var count = 10;
var gameEnd = {
    countdown: "",
    data: "",
    init: function(data) {
        this.data = data;
        count = 10;
        console.log(data);
    },
    //Load all assets for the menu
    preload: function () {
        //Create loading text
        // var loadlingLabel = game.add.text(80, 140, "display table?...", { font: "30px Courier", fill: "#ffffff" });
        var winner = game.add.text(90, 140, "Winner: " + this.data.winner.username, { font: "30px Courier", fill: "#ffffff" });
        this.countdown = game.add.text(90, 400, "Next level in " + count, { font: "30px Courier", fill: "#ffffff" });

        this.createTable();
    },
    create: function () {
        console.log("we are in eng game?");
        var selfs = this;
        
        //count down before game restarts
        var timer = setInterval(function() {
            count--;

            selfs.countdown.text =  "Next level in " + count;

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

        game.add.text(180, 180, "POS", fontStyle);
        game.add.text(260, 180, "NAME", fontStyle);
        game.add.text(380, 180, "KILLS", fontStyle);
        game.add.text(470, 180, "DEATHS", fontStyle);
        game.add.text(560, 180, "DAMAGE", fontStyle);
        
        var count = 1;

        var yOffset = 200;

        console.log(players);

        $.each(players, function(i, player) {
            game.add.text(190, yOffset, count++, fontStyle);
            game.add.text(270, yOffset, player.username, fontStyle);
            game.add.text(390, yOffset, player.kills, fontStyle);
            game.add.text(480, yOffset, player.deaths, fontStyle);
            game.add.text(570, yOffset, player.damageDelt, fontStyle);

            yOffset += 20;
        });


    }
};

