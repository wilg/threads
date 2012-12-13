# Setup Pusher
push_key = $("meta[name=push-key]").attr('content')
push_channel = $("meta[name=push-channel]").attr('content')

if push_key? and push_channel?
  window.pusher = new Pusher($("meta[name=push-key]").attr('content'))

  channel = window.pusher.subscribe(push_channel)
  channel.bind 'message_created', (data) ->
    console.log data
    # alert data.id
    window.notify("#{data.user_name} in #{data.thread_name}", data.body)