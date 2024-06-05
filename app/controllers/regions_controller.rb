class RegionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  def index
    @user = current_user
    @regions = Region.all
  end
end
