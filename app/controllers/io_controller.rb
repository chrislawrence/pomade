class IoController < ApplicationController
  
  def import
    Importer.new(current_user).import(params[:file])
    redirect_to '/#timer', notice: 'Pomodoros imported'
  end

end
