// JavaScript source code for menuState

var stats = {
    init: function() {
        //get data
        $.ajax({
            type:'GET',
            url: '/get-user-stats',
            success: function(data) {
                console.log(data);
            }
        });
    },
    create: function () {
		
		//display data here


    },

    //Start function
    start: function () {
		
		//Stop Music
		//music.stop();

        //Loads playState
        game.state.start('play');	
    }
};

