# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user

  def current_user
    if (user_id = session[:user_id])
      return @user ||= User.find(user_id)
    end
  end

  def logged_in?
    !current_user.nil?
  end
end
