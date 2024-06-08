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
end
