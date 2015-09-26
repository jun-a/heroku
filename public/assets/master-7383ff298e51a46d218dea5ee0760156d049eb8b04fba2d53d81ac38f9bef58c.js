$.material.init();

<!--ここはクリック時に影がでる挙動のjs-->
$(document).on("click", "#shadow-sample2, #shadow-sample3", function() {
  var tap = ($(this).data("tap") * 1) + 1;
  if (tap === 6) {
    tap = 0;
  }
  $(this).data("tap", tap);
  var shadow = "shadow-z-" + tap;
  $(this).attr("class", shadow);
});


$(document).ready(function() {
  // This command is used to initialize some elements and make them work properly
  $.material.init();
});
