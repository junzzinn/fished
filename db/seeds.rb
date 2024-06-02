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
  "Goldfish" => "goldfish.png",
  "Salmon" => "salmon.png",
  "Clownfish" => "clownfish.png",
  "Betta" => "betta.png",
  "Tuna" => "tuna.png",
  "Shark" => "shark.png",
  "Eel" => "eel.png",
  "Catfish" => "catfish.png",
  "Guppy" => "guppy.png",
  "Barracuda" => "barracuda.png"
}

beachImages = ["https://www.viagenscinematograficas.com.br/wp-content/uploads/2014/11/Melhores-Praias-do-Rio.jpg", "https://static.ndmais.com.br/2022/11/prainha-800x534.jpg", "https://blog.maxmilhas.com.br/wp-content/uploads/2019/06/Praia-do-Forno-Arraial-dAjuda.jpg", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlFYawERCWlbDWBuW-eSyJMKcrXHIafeFHo_OL4-0fWA&s", "https://www.cvc.com.br/dicas-de-viagem/wp-content/uploads/2021/10/8-melhores-praias-da-regiao-dos-lagos-no-rio-de-janeiro-1170x650.png"]
regionImage = ["https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Beach_at_Fort_Lauderdale.jpg/1200px-Beach_at_Fort_Lauderdale.jpg", "https://cdn.folhadoslagos.com/upload/dn_noticia/2020/01/paraty11.jpg", "https://viajabi.com.br/wp-content/uploads/2017/05/aventura-em-ilha-grande-rio-de-janeiro-jeff-slaid-viaja-bi-02.jpg", "https://www.ubatuba.sp.gov.br/wp-content/uploads/sites/2/2016/12/Praia-Grande-lotada-e1635945840950.jpg", "https://blog.123milhas.com/wp-content/uploads/2022/07/balneario-camboriu-curiosidades-sobre-a-cidade-do-litoral-catarinense-conexao123.jpg"]
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

  region = Region.create!(
    name: Faker::Address.city,
    regionImage: regionImage.sample
  )

  spot1 = Spot.create!(
    longitude: Faker::Address.longitude,
    latitude: Faker::Address.latitude,
    name: beach_names.sample,
    region: region,
    spotImage: beachImages.sample,

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
