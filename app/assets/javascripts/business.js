// $(document).ready(function() {
//     $("#toggler").hide(function{
//       $("toggler-btn").on
//     });
// });

$(document).on("ready page:load", function () {
      $("#toggler-btn").click(function(){
        $("#toggler").slideToggle("slow");
    });

    $("#toggler").hide();
});

// $(document).ready(function(){
//     $("#toggler-btn").click(function(){
//         $("#toggler").slideToggle("slow");
//     });

//     $("#toggler").hide();
// });