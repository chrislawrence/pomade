class Api::UserPomodorosController < Api::BaseController 
  def index
    if params[:auth_token]
      respond_with User.find_by(token: params[:auth_token]).pomodoros.today
    else
      render nothing: true
    end
  end
end
