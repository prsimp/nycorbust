# Category auto-complete
jQuery ->
  $("#item_category_name").autocomplete
    source: $('#item_category_name').data('autocomplete-src')

# Item Gallery Swap
jQuery ->
  $(".swap").click ->
    img_src = $(this).find("img").attr("src").replace /small/, "large"
    $("#primary-image").attr("src", img_src).hide().fadeIn(100,"linear")

# Preload images after page loads to improve transition
#jQuery ->
#  $(document).ready ->
