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

  def title_tag
    title = ["Threads#{Rails.env.development? ? " [Development]" : ""}"]
    title += @page_titles if @page_titles.present?
    content_tag :title, title.join(" - ")
  end

  def render_subtitle
    return nil unless @page_titles.length >= 2
    @page_titles[1]
  end

  def title(*titles)
    @page_titles = titles
    content_tag(:div, content_tag(:h1, titles.first), class: "page-header")
  end

end
