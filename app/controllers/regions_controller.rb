class RegionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  def index
    @user = current_user
    @regions = Region.all
  end

  def show
    @user = current_user
    @id = params[:id]
    @region = Region.find(params[:id])
  end
end
