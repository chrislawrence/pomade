class Api::BaseController < ApplicationController
  respond_to :json
  before_action :default_to_json

  private

  def default_to_json
    request.format = :json if params[:format].nil?
  end

end
