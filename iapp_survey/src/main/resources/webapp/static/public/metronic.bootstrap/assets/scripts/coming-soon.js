var ComingSoon = function () {

    return {
        //main function to initiate the module
        init: function () {

            $.backstretch([
    		        "/public/metronic.bootstrap/assets/img/bg/1.jpg",
    		        "/public/metronic.bootstrap/assets/img/bg/2.jpg",
    		        "/public/metronic.bootstrap/assets/img/bg/3.jpg",
    		        "/public/metronic.bootstrap/assets/img/bg/4.jpg"
    		        ], {
    		          fade: 1000,
    		          duration: 10000
    		    });

            var austDay = new Date();
            austDay = new Date(austDay.getFullYear() + 1, 1 - 1, 26);
            $('#defaultCountdown').countdown({until: austDay});
            $('#year').text(austDay.getFullYear());
        }

    };

}();