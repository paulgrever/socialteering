//fadeout flash messages
var hideFlashes = function() {
  $(".alert-notice, .alert-success, .alert-danger").fadeOut(4000);
};

$(document).on("ready page:load", function() {
    setTimeout(hideFlashes, 4000);
});