class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authorise 
  skip_before_filter :authorise, only: :index
  def current_user
    User.current(cookies[:auth_token])
  end
  
  def index
    render 'index', :layout => 'ember'
  end
  
  def authorise
    #TODO: fix this to no longer have an if statement
    redirect_to login_url, alert: "Please log in" if current_user.kind_of?(GuestUser)
  end
  end
