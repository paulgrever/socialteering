// $(document).ready(function() {
//     $("#toggler").hide(function{
//       $("toggler-btn").on
//     });
// });

$(document).ready(function(){
    $("#toggler-btn").click(function(){
        $("#toggler").slideToggle("slow");
    });

    $("#toggler").hide();
});