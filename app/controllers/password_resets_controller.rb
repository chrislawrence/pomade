class PasswordResetsController < ApplicationController
  skip_before_filter :authorise
  def create
    @password_reset = PasswordReset.new(:email => params[:password_reset][:email])
    if @password_reset.save
      redirect_to root_url, :notice => "Email sent with password reset instructions"
    else
      render action: 'new'
    end
  end
  
  def new
    @password_reset = PasswordReset.new
  end
  
  def edit
    reset = PasswordReset.where(:token => params[:id]).first
    if reset.created_at > 2.hours.ago
      @user = User.where(:email => reset.email).first
    else
      redirect_to root_path, notice: 'Reset token expired.'
    end
  end

  def update
    PasswordReset.reset_password(params[:user][:email], params[:id], params[:user][:password])
 redirect_to login_path, notice: 'Password successfully reset.' 
  end
end
