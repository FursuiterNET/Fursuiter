$.fn.clock = function () {
    var hours = $(this).find("#hours");
    var minutes = $(this).find("#minutes");
    var seconds = $(this).find("#seconds");
    var pad = function (n) {
        return (n < 10) ? ("0" + n) : n;
    };
    var update = function () {
        var date = new Date();
        hours.text(pad(date.getHours()));
        minutes.text(pad(date.getMinutes()));
        seconds.text(pad(date.getSeconds()));
    };

    setInterval(update, 500);
};

$(window).load(function () {
    $(".clock").clock();
    $(".nav-toggle").click(function () {
        $(".nav-menu").toggle();
        $(".dash-menu").toggle();
    });
});