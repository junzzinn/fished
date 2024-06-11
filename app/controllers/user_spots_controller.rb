class UserSpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  def index
    @region_images = [
      "https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Beach_at_Fort_Lauderdale.jpg/1200px-Beach_at_Fort_Lauderdale.jpg",
      "https://cdn.folhadoslagos.com/upload/dn_noticia/2020/01/paraty11.jpg",
      "https://viajabi.com.br/wp-content/uploads/2017/05/aventura-em-ilha-grande-rio-de-janeiro-jeff-slaid-viaja-bi-02.jpg",
      "https://www.ubatuba.sp.gov.br/wp-content/uploads/sites/2/2016/12/Praia-Grande-lotada-e1635945840950.jpg",
      "https://blog.123milhas.com/wp-content/uploads/2022/07/balneario-camboriu-curiosidades-sobre-a-cidade-do-litoral-catarinense-conexao123.jpg"
    ]
    if user_signed_in?
      @regions = current_user.regions
      @user = current_user
    end
  end

  def create
    @user = current_user
    @spot = Spot.find(params[:spot_id])
    user_spot = UserSpot.find_by(user: @user, spot: @spot)

    if user_spot
      # If the user already has the spot, delete the UserSpot record
      user_spot.destroy
    else
      # If the user does not have the spot, create a new UserSpot record
      UserSpot.create!(user: @user, spot: @spot)
    end
  end
end
