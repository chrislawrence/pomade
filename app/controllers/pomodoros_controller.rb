class PomodorosController < ApplicationController
  skip_before_filter :authorise, only: :create
  respond_to :html, :json
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
    tag = params[:pomodoro][:tag]
    worker = UserPomodoros.new(current_user)
    render json: worker.add_pomodoro(tag)
  end
  
  def destroy
    worker = UserPomodoros.new(current_user)
    respond_with worker.delete_pomodoro(params[:id])
  end
  
  def update
    respond_with Pomodoro.update(params[:id], pomodoro_params)
  end
  
  def pomodoro_params
    params.require(:pomodoro).permit(:start_time,:end_time,:tag)
  end
end
