# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Create Users

fish_names = {
  "Goldfish" => "https://t3.ftcdn.net/jpg/01/08/68/84/360_F_108688475_hd0C2OVeOvosjDtDMIMg89q7MFTsR1Oy.jpg",
  "Salmon" => "https://www.gastronomiavasca.net/uploads/image/file/3268/salmon.jpg",
  "Clownfish" => "https://cdn.awsli.com.br/2500x2500/2599/2599158/produto/222903609142a84c856.jpg",
  "Betta" => "https://aquariosparapeixes.com/wp-content/uploads/2022/09/Betta-Plakat.webp",
  "Tuna" => "https://fishcode.com.br/cdn/shop/files/BlackFintunaThunnusatlanticus_1.png?v=1700761551",
  "Shark" => "https://images.fineartamerica.com/images/artworkimages/mediumlarge/1/great-white-shark-side-profile-corey-ford.jpg",
  "Eel" => "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1cLg7paU0Gcy6ScxlBp6m92B0GGpMY6y0bRULPqfJ6A&s",
  "Catfish" => "https://nas.er.usgs.gov/XIMAGESERVERX/2019/20191004074947.jpg",
  "Guppy" => "https://www.carolina.com/images/product/large/145538.jpg",
  "Barracuda" => "https://s3.divcom.com/seafoodsource.com/images/58e56a7df141df00115725f58a2a6f36.jpeg"
}

beachImages = ["https://www.viagenscinematograficas.com.br/wp-content/uploads/2014/11/Melhores-Praias-do-Rio.jpg", "https://static.ndmais.com.br/2022/11/prainha-800x534.jpg", "https://blog.maxmilhas.com.br/wp-content/uploads/2019/06/Praia-do-Forno-Arraial-dAjuda.jpg", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlFYawERCWlbDWBuW-eSyJMKcrXHIafeFHo_OL4-0fWA&s", "https://www.cvc.com.br/dicas-de-viagem/wp-content/uploads/2021/10/8-melhores-praias-da-regiao-dos-lagos-no-rio-de-janeiro-1170x650.png"]
regionImage = ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkCViMQQazvkSrlPH5E61zI1sqPS3GuKD4ozJw3x8OZg&s", "https://cdn.folhadoslagos.com/upload/dn_noticia/2020/01/paraty11.jpg", "https://viajabi.com.br/wp-content/uploads/2017/05/aventura-em-ilha-grande-rio-de-janeiro-jeff-slaid-viaja-bi-02.jpg", "https://www.ubatuba.sp.gov.br/wp-content/uploads/sites/2/2016/12/Praia-Grande-lotada-e1635945840950.jpg", "https://blog.123milhas.com/wp-content/uploads/2022/07/balneario-camboriu-curiosidades-sobre-a-cidade-do-litoral-catarinense-conexao123.jpg"]
beach_names = [
  "Sunny Beach",
  "Paradise Cove",
  "Golden Sands",
  "Coral Bay",
  "Blue Lagoon"
]

10.times do

  user1 = User.create!(
    email: Faker::Internet.email,
    password: "password"
  )

  user2 = User.create!(
    email: Faker::Internet.email,
    password: "password"
  )

  spot1 = Spot.create!(
    longitude: Faker::Address.longitude,
    latitude: Faker::Address.latitude,
    name: beach_names.sample,
    region: Faker::Address.city,
    spotImage: beachImages.sample,
    regionImage: regionImage.sample
  )

  fish = fish_names.to_a.sample

  fish1 = Fish.create!(
    name: fish[0],
    fishImage: fish[1]
  )

  fish = fish_names.to_a.sample

  fish2 = Fish.create!(
    name: fish[0],
    fishImage: fish[1]
  )

  fish_spot = FishesSpot.create!(
    spot_id: spot1.id,
    fish_id: fish1.id
  )

  fish_spot = FishesSpot.create!(
    spot_id: spot1.id,
    fish_id: fish2.id
  )

  user_spot = UserSpot.create!(
    user_id: user1.id,
    spot_id: spot1.id
  )
end
