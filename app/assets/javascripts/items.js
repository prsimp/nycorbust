// Item Category auto-complete

$(function() {
  $("#item_category_name").autocomplete({
    source: $("#item_category_name").data("autocomplete-src")
  });
});

// Item Gallery Swap

$(function() {
  $(".swap").click(function() {
    var img_src = $(this).find("img").attr("src").replace(/small/,"large");
    $("#primary-image").fadeOut(100, function() {
      $("#primary-image").attr("src", img_src).fadeIn(100);
    });
  });
});