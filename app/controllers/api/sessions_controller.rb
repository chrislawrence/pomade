class Api::SessionsController < Api::BaseController 
  def new
    user = User.find_by(email: params[:username])
    if user.authenticate(params[:password])
      render json: {access_token: user.token, token_type: "bearer"}
    else
      head 401
    end
  end
end
