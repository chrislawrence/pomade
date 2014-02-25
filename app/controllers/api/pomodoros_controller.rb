class Api::PomodorosController < Api::BaseController 
  def index
    respond_with Pomodoro.all
  end
  
  def show
    respond_with Pomodoro.find(params[:id])
  end

  def create
    pomodoro = Pomodoro.new(pomodoro_params)
    if pomodoro.save
      render json: pomodoro, status: 201
    else
      render json: {errors: pomodoro.errors}, status: 422
    end
  end

  def update
    pomodoro = Pomodoro.find(params[:id])
    if pomodoro.update(pomodoro_params)
      render json: pomodoro, status: 200
    else
      render json: {errors: pomodoro.errors}, status: 422
    end
  end


  private
  
  def pomodoro_params
    params.require(:pomodoro).permit(:start_time, :end_time, :tag, :user_id)
  end
end
