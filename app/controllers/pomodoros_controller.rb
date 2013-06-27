class PomodorosController < ApplicationController
  def index
    if current_user
      respond_to do |format|
        format.json { render json:  current_user.pomodoros.today }
        format.html {@pomodoros = current_user.pomodoros.today }  
      end
      
    end
  end
  
  def show
    render json: Pomodoro.find(params[:id])
  end
  
  def create
    if current_user
      pomodoro = Pomodoro.new(pomodoro_params)
      current_user.pomodoros << pomodoro
      render json: pomodoro 
    else
      render :nothing => true
    end
  end
  
  def destroy
    render json: Pomodoro.destroy(params[:id])
  end
  
  def pomodoro_params
    params.require(:pomodoro).permit(:start_time,:end_time,:tag)
  end
end
