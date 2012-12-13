module ApplicationHelper

  def flash_class(level)
    case level
    when :notice then "alert-info"
    when :error then "alert-error"
    when :alert then "alert-warning"
    end
  end

  def gravatar_tag email, options = {}
    Gravatar.new(email).image_url({ssl: true, default: :retro}.merge(options))
  end

  def avatar user, options = {}
    gravatar_tag user.email, options
  end

end
