class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def current_user
    User.where(:auth_token => cookies[:auth_token]).first
  end

  def authorise
    redirect_to login_url, alert: "Please log in" if current_user.nil?
  end
  end
