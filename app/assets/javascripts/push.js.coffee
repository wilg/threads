return if window.pusher?

# Setup Pusher
push_key = $("meta[name=push-key]").attr('content')
push_channel = $("meta[name=push-channel]").attr('content')
current_user_id = $("meta[name=current-user]").attr('content')

if push_key? and push_channel?
  window.pusher = new Pusher($("meta[name=push-key]").attr('content'))

  channel = window.pusher.subscribe(push_channel)
  channel.bind 'message_created', (data) ->
    console.log data

    if "#{data.user_id}" is "#{current_user_id}"
      console.log "Recieved a notification about user #{data.user_id} but we are #{current_user_id}"
    else
      window.notify("#{data.user_name} in #{data.thread_name}", data.body)
