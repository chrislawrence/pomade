class SessionsController < ApplicationController
  skip_before_filter :authorise

  def new
  end

  def create
    user = User.where(:email => params[:user][:email]).first
    if user and user.authenticate(params[:user][:password])
      
      if params[:remember]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      
      redirect_to root_path, :notice => "Logged in"
    else
      redirect_to login_url, alert: "Email or password was invalid."
    end
  end

  def destroy
    cookies[:auth_token] = nil
    redirect_to root_path, notice: 'Logged out'
  end

  private

  def login_params
    params.require(:user, :remember).permit(:email,:password)
  end
end
