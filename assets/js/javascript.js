$(document).ready(function () {
    var counter = 0;
    $(".test").on("click", function () {
        counter += 1;
        if (counter < 5) {
            $(".test").css("background-color", "#159957");
        } else if (counter < 10) {
            $(".test").css("background-color", "#1e6bb8");
        } else {
            $(".test").css("background-color", getRandomColor());
        }
        Console.log(
            "If you can see this. JavaScript is enabled. " +
            "This also means jQuery is also working."
        );
    });

});

function getRandomColor() {
    var letters = "0123456789ABCDEF";
    var color = "#";
    for (var i = 0; i < 6; i++) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;

}
