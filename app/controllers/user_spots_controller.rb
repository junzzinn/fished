class UserSpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  def index
    if user_signed_in?
      @regions = current_user.regions
    end
  end
end
