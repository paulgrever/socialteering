$(document).on("ready page:load", function() {

  var createEvent = function () {
    var userId = $(this).attr("data-user");
    var eventId = $(this).attr("data-event");
    var request = $.ajax({
      url: "/api/v1/user_events.json",
      method: "POST",
      data: { user_event: { user_id: userId, event_id: eventId } }
    });

    request.done(function() {
      console.log("YOLO");
    });
  };

  $("#create-event").on("click", createEvent);

});