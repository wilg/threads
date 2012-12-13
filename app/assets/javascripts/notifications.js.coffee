window.notify = (title, message) ->
  console.log "Notifying title: #{title}"
  console.log "Notifying message: #{message}"
  notification = window.webkitNotifications.createNotification(null, title, message)
  notification.show()

ready = ->

  $('.local-notification-dependent').hide()

  if window.webkitNotifications

    checkPerm = ->
      $('.local-notification-dependent').hide()
      if window.webkitNotifications.checkPermission() == 0
        # It's allowed
      else if window.webkitNotifications.checkPermission() == 2
        $('.local-notification-dependent.permission-denied').show()
      else
        $('.local-notification-dependent.permission-required').show()

    window.askForNotificationPermission = ->
      if window.webkitNotifications.checkPermission() == 0
        checkPerm()
      else
        window.webkitNotifications.requestPermission(checkPerm)

    $('.enable-notifications-link').off().click (e) ->
      e.preventDefault()
      window.askForNotificationPermission()

  else
    $('.local-notification-dependent.unsupported').show()

$(document).ready(ready)
$(document).on('page:change', ready)

# window.notify("fuc", "k")

# localNotify = (title, message) ->
#   if window.webkitNotifications
#     console.log "window.webkitNotifications are supported"
#     if window.webkitNotifications.checkPermission() == 0
#       console.log "notifications have been allowed"
#     else
#       console.log "requesting permission"
#       window.webkitNotifications.requestPermission()
#   else
#     console.log "window.webkitNotifications NOT supported"


# has_local_notification_permission = ->
#   switch window.webkitNotifications.checkPermission()
#     when 0
#       return yes
#     when 2
#       return no