class UsersController < ApplicationController
  skip_before_filter :authorise, :only => [:show,:new,:create, :index, :me]
  def index
  end

  def new
    if !current_user.kind_of?(GuestUser)
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def edit
    @user = current_user
  end
  
  def show
    @user = User.find_by(username: params[:id])
    raise ActiveRecord::RecordNotFound unless @user
    @stats = UserStats.new(@user)
  end
  
  def me
    render json: current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to root_path, :notice => "Profile updated" 
    else
      render action: 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      cookies[:auth_token] = @user.auth_token
      redirect_to settings_path, notice: 'Account created. Please confirm your email address.'
    else
      render action: 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email,:username,:password,:password_confirmation, :avatar, :url, :break_time, :work_time)
  end

end
