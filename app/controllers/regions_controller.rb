class RegionsController < ApplicationController
  def index
    @user = current_user
    @regions = Region.all
  end
end
