class ApplicationController < ActionController::Base
  def current_user
    @user = user.find_by(id: session[:user_id])
  end
end
