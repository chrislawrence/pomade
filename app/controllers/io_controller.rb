class IoController < ApplicationController
  
  def import
    Importer.new(current_user).import(params[:file])
    redirect_to current_user, notice: 'Pomodoros imported'
  end

  def index
  end

end
