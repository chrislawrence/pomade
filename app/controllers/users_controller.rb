class UsersController < ApplicationController
  def index
  end

  def new
    if current_user
      redirect_to '/#timer'
    else
      @user = User.new
    end
  end

  def edit
  end
  
  def show
    @user = User.where(:username => params[:username]).first
    @stats = UserStats.new(@user)
    redirect_to '/404' if !@user
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
    params.require(:user).permit(:email,:username,:password,:password_confirmation)
  end

end
