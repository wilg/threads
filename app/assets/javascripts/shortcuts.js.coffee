ready = ->

  Mousetrap.reset()
  $(".key-compose").each ->
    elem = $(@)
    Mousetrap.bind 'ctrl+c', ->
      elem.click()
  # $(".key-send").each ->
  #   elem = $(@)
  #   Mousetrap.bind 'command+enter', ->
  #     elem.click()

$(document).ready(ready)
$(document).on('page:change', ready)