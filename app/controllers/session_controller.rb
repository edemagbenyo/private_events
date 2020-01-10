# frozen_string_literal: true

class SessionController < ApplicationController
  def signin
    @user = User.new
  end

  def create
    # puts params
    user = User.find_by(email: params[:email])
    if user
      log_in user
      redirect_to user
    else
      @user = User.new
      render 'session/signin'
    end
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def log_out
    session.delete(:user_id)
    cookies.delete(:user_id)
    @user = nil
  end
end
