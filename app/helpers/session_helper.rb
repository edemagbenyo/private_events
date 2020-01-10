# frozen_string_literal: true

module SessionHelper
  def log_in(user)
    session[:user_id] = user.id
  end
end
