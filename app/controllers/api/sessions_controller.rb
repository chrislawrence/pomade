class Api::SessionsController < Api::BaseController
  def create
    @user = User.find_by(email: params[:email]) || GuestUser.new
    if @user.authenticate(params[:password])
      render json: {auth_token: @user.token, user_id: @user.id}, status: 201
    else render json: {error: 'Invalid email or password'}, status: 400
    end
  end

  def destroy
  end

end
