ready = ->

  $("#thread-quick-reply-shield").off().click (e) ->
    e.preventDefault()
    $("#thread-quick-reply-shield").hide()
    $("#thread-quick-reply").show()
    $("#thread-quick-reply textarea").focus().val("")

  # $("#thread-quick-reply form").off("ajax:success").on 'ajax:success', ->
  #   $(@).closest(".thread-show").trigger('threads:update')

  $('.thread-show').off().on 'threads:update', ->
    el = $(@)
    $.getScript el.data("update-url"), (script, textStatus, jqXHR) ->
      $("#thread-quick-reply-shield").show()
      $("#thread-quick-reply").hide()
      $('time[data-time-ago]').timeago();

$(document).ready(ready)
$(document).on('page:change', ready)