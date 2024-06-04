class UserSpotsController < ApplicationController
  def index
    @user = current_user.email
    if user_signed_in?
      @regions = Region.all
    end
  end
end
