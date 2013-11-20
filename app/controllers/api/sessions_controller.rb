class Api::SessionsController < Api::BaseController
  def create
    @user = User.find_by(email: params[:user][:email]) || GuestUser.new
    if @user.authenticate(params[:user][:password])
      render json: {user_id: @user.id, token: @user.token }, status: 201
    else
      render json: {}, status: 401
    end
  end

  def destroy
  end

  private

end
