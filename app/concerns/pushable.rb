module Pushable

  # Must respond to user

  def push type, hash
    Pusher[push_channel].trigger(type, hash)
  end

  def push_channel
    user.push_channel
  end

  # Pusher['test_channel'].trigger('greet', {:greeting => "Hello there!"})

end