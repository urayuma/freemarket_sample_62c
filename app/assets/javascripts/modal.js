document.addEventListener(
  "DOMContentLoaded",
  e => {
    let modal_open = document.getElementById("modal-open-btn");
    modal_open.onclick = function() {
      $("#overlay").fadeIn();
      document.getElementById("modal-close-btn").onclick = function() {
        $("#overlay").fadeOut();
      };
      document.getElementById("delete-comformation-btn").onclick = function() {
        console.log("fejfdfa");
        document.getElementById("item-delete-btn").click();
      };
    };
  },
  false
);
