class PomodorosController < ApplicationController
respond_to :json
  def index
    respond_with Pomodoro.today
  end
  
  def show
    respond_with Pomodoro.find(params[:id])
  end
  
  def create
    respond_with Pomodoro.create(pomodoro_params)
  end
  
  def destroy
    respond_with Pomodoro.destroy(params[:id])
  end
  
  def pomodoro_params
    params.require(:pomodoro).permit(:start_time,:end_time,:tag)
  end
end
