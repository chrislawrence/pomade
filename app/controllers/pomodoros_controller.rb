class PomodorosController < ApplicationController
  skip_before_filter :authorise, only: :create
  def index
    if current_user
      respond_to do |format|
        format.json { render json:  current_user.pomodoros.today }
        format.html {@pomodoros = current_user.pomodoros }  
      end
      
    end
  end
  
  def show
    render json: Pomodoro.find(params[:id])
  end
  
  def create
    pomodoro = Pomodoro.new_for_user(current_user.work_time, Time.now, params[:tag] )
    current_user.pomodoros << pomodoro
    render json: pomodoro 
  end
  
  def destroy
    render json: Pomodoro.destroy(params[:id])
  end
  
  def pomodoro_params
    params.require(:pomodoro).permit(:start_time,:end_time,:tag)
  end
end
