class UsersController < ApplicationController
  skip_before_filter :authorise, :only => [:show,:new,:create, :index]
  def index
  end

  def new
    if !current_user.kind_of?(GuestUser)
      redirect_to '/#timer'
    else
      @user = User.new
    end
  end

  def edit
    @user = current_user
  end
  
  def show
    @user = User.where(:username => params[:id]).first  
    redirect_to '/404' if !@user
    @stats = UserStats.new(@user) if @user
  end
  
  def me
    render json: current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to '/#timer', :notice => "Profile updated" 
    else
      render action: 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '/#timer', notice: 'Account created. Please confirm your email address.'
    else
      render action: 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email,:username,:password,:password_confirmation, :avatar, :url, :break_time, :work_time)
  end

end
