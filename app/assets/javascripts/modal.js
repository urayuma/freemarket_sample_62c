$(document).on("turbolinks:load", function() {
  $("#modal-open-btn").on("click", function() {
    $("#overlay").fadeIn();
  });
  $("#modal-close-btn").on("click", function() {
    $("#overlay").fadeOut();
  });
  $("#delete-comformation-btn").on("click", function() {
    $("#item-delete-btn").trigger("click");
  });
});
