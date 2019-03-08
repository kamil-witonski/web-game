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
        var loadlingLabel = game.add.text(80, 150, "display table?...", { font: "30px Courier", fill: "#ffffff" });
        var winner = game.add.text(90, 160, "Winner" + this.data.winner, { font: "30px Courier", fill: "#ffffff" });
    },
    create: function () {
        console.log("we are in eng game?");

        var selfs = this;

        var count = 5;

        //count down before game restarts
        var timer = setInterval(function() {
            console.log("sadasdas");
            count--;
            if(count == 1) {
                clearInterval(timer);  
                game.state.start("play", false, false, selfs.data.level);
            } 
        }, 1000);
    },
};

