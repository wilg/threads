ready = ->

  # $(".star-button").off("click").click (e) ->
  #   e.preventDefault()
  #   alert "star"
  $('.star-button').tooltip
    title: "Starring a message closes the thread and displays the starred message at the top."
    placement: "left"

$(document).ready(ready)
$(document).on('page:change', ready)
$(document).ajaxComplete(ready)