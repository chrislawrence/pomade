class Api::UsersController < Api::BaseController
  before_filter :auth_only!

  def index
    respond_with User.all
  end

  def show
    respond_with User.find(params[:id])
  end
end
