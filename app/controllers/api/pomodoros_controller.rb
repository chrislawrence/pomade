class Api::PomodorosController < ApplicationController
  respond_to :json

  def index
    respond_with Pomodoro.all
  end

  private

  def pomodoro_params
    params.require(:pomodoro).permit(:start_time, :end_time, :tag)
  end
end
