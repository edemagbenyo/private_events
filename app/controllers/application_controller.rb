# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user

  def current_user
    return @user ||= User.find(user_id) unless user_id = session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end
end
