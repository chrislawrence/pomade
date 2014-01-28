class Api::UserPomodorosController < Api::BaseController 
  def index
    if params[:auth_token]
      respond_with User.find_by(token: params[:auth_token]).pomodoros.today
    else
      render nothing: true
    end
  end

  def destroy
    if params[:auth_token]
      respond_with Pomodoro.destroy(params[:id])
    end
  end

  def update
    if params[:auth_token]
      respond_with Pomodoro.update(params[:id], pomodoro_params)
    end
  end

  def pomodoro_params
    params.require(:user_pomodoro).permit(:start_time, :end_time, :tag, :user_id, :auth_token)
  end

end
