ready = ->
  $('time[data-time-ago]').timeago()

$(document).ready(ready)
$(document).on('page:change', ready)
$(document).ajaxComplete(ready)