class InfoController < ApplicationController

  skip_authorization_check

  def index
    redirect_to projects_path if user_signed_in?
  end

end
