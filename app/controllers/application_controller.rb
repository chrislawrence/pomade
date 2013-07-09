class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authorise 
  skip_before_filter :authorise, only: :index
  around_filter :user_time_zone
  
  def current_user
    User.current(cookies[:auth_token])
  end
  
  def index
    render 'index', :layout => 'ember'
  end
  
  private

  def authorise
    redirect_to login_url, alert: "Please log in" if !current_user.authorised?
  end

  def user_time_zone(&block)
    Time.use_zone(current_user.time_zone, &block)
  end

end
