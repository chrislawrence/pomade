class Api::PomodorosController < Api::BaseController 

  def index
    respond_with Pomodoro.all
  end

  def show
    respond_with Pomodoro.find(params[:id])
  end

  def create
    user = User.find_by token:  params[:auth_token]
    @pomodoro = Pomodoro.new(pomodoro_params)
    user.pomodoros << @pomodoro if user
    if @pomodoro.errors.present?
      render json: {errors: @pomodoro.errors.messages}, status: 422
    else
      render json: @pomodoro
    end
  end

  def update
    respond_with Pomodoro.update(params[:id], pomodoro_params)
  end

  def destroy
    respond_with Pomodoro.destroy(params[:id])
  end

  private

  def pomodoro_params
    params.require(:pomodoro).permit(:start_time, :end_time, :tag, :user_id, :auth_token)
  end
end
