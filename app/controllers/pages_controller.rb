class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user_name = current_user.name if user_signed_in?
  end
  
end
