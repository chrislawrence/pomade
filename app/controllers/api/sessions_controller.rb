class Api::SessionsController < Api::BaseController
  def create
    @user = User.find_by(email: params[:username]) || GuestUser.new
    if @user.authenticate(params[:password])
      render json: {access_token: @user.token, token_type: 'bearer'}
    else render json: {error: 'Invalid email or password'}, status: 400
    end
  end

  def destroy
  end

end
