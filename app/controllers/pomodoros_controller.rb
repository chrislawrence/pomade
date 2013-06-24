class PomodorosController < ApplicationController
  def index
    render json: Pomodoro.all
  end
  
  def create
    render json: Pomodoro.create(pomodoro_params)
  end
  
  private
  
  def pomodoro_params
    params.require(:pomodoro).permit(:start_date,:end_date,:tag)
  end
end
