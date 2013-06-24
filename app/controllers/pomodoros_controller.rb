class PomodorosController < ApplicationController
  def index
    render json: Pomodoro.all
  end
end
