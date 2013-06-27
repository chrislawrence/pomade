class PomodorosController < ApplicationController
respond_to :json
  def index
    if current_user
      respond_with current_user.pomodoros.today
    else
      render :nothing => true
    end
  end
  
  def show
    respond_with Pomodoro.find(params[:id])
  end
  
  def create
    if current_user
      pomodoro = Pomodoro.new(pomodoro_params)
      current_user.pomodoros << pomodoro
      respond_with pomodoro 
    else
      render :nothing => true
    end
  end
  
  def destroy
    respond_with Pomodoro.destroy(params[:id])
  end
  
  def pomodoro_params
    params.require(:pomodoro).permit(:start_time,:end_time,:tag)
  end
end
