class Api::UserPomodorosController < Api::PomodorosController
  def index
    if params[:auth_token]
      logger.debug("Time: #{Time.zone.now}")
      respond_with User.find_by(authentication_token: params[:auth_token]).pomodoros.today
    else
      render nothing: true, status: 200
    end
  end

private
  def pomodoro_params
    params.require(:user_pomodoro).permit(:start_time, :end_time, :tag, :user_id, :auth_token)
  end
end
