class Api::PomodorosController < ApplicationController
  respond_to :json

  def index
    respond_with Pomodoro.all
  end

  def show
    respond_with Pomodoro.find(params[:id])
  end

  def update
    respond_with Pomodoro.update(params[:id], pomodoro_params)
  end

  private

  def pomodoro_params
    params.require(:pomodoro).permit(:start_time, :end_time, :tag)
  end
end
