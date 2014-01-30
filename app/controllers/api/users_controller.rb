class Api::UsersController < Api::BaseController
  def index
    respond_with User.all
  end

  def show
    respond_with User.find(params[:id]) 
  end
  
  def create
  end

  def update
    user = User.find_by authentication_token: params[:auth_token]
    if user 
      respond_with user.update_attributes(user_params)
    else
      render json: {errors: 'Not authorised to edit this user'}, status: 422
    end
  end

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation, :first_name, :last_name, :website, :avatar)
  end
end
