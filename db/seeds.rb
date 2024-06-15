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
  "Goldfish" => ["goldfish.png", "Stick", "Vara de bambu", "Manhã cedo ou fim da tarde", "Pesque em águas calmas e use pequenos pedaços de pão ou larvas como isca adicional. Seja paciente e evite fazer barulhos altos."],
  "Salmon" => ["salmon.png", "Fly", "Vara de mosca", "Manhã cedo ou fim da tarde, especialmente durante as migrações sazonais", "Pesque durante a migração do salmão, que geralmente ocorre na primavera e no outono. Use iscas que imitam insetos aquáticos e pesque em rios ou riachos com correnteza."],
  "Clownfish" => ["clownfish.png", "Pequenos camarões artificiais", "Vara de bambu", "Durante o dia", "Pesque em recifes de corais em águas tropicais. Use iscas coloridas para atrair a atenção deles."],
  "Betta" => ["betta.png", "Micro Pellets", "Varas telescópicas de fibra", "Manhã cedo ou fim da tarde", "Pesque em águas calmas e rasas. Use iscas pequenas e evite fortes correntes de água. Betas são territoriais, então tente diferentes áreas do habitat."],
  "Tuna" => ["tuna.png", "Jigging", "Varas telescópicas de fibra", "Manhã cedo e fim da tarde", "Pesque em alto mar, de preferência em águas profundas. Utilize sonda de pesca para localizar cardumes. A pescaria é melhor durante a manhã cedo ou ao entardecer."],
  "Shark" => ["shark.png", "Cebo vivo grande", "Vara para Molinete Sparta", "Fim da tarde e noite", "Pesque em alto mar ou em áreas costeiras profundas. Use iscas grandes e frescas, como peixes menores ou pedaços de carne. Certifique-se de ter equipamentos de segurança adequados."],
  "Eel" => ["eel.png", "Vermes", "Varas de fibra de vidro para molinetes ou carretilhas", "Noite e madrugada", "Pesque à noite ou ao amanhecer em áreas lamacentas ou rochosas. Use iscas vivas como vermes ou pequenos peixes e mantenha a linha próxima ao fundo."],
  "Catfish" => ["catfish.png", "Pasta", "Varas longas de fibras mistas para molinetes", "Noite e madrugada", "Pesque em rios ou lagos de águas calmas. Catfish são mais ativos durante a noite, então pescar à noite pode ser mais eficaz. Use iscas com cheiro forte, como fígado de galinha ou queijo."],
  "Guppy" => ["guppy.png", "Flocos", "Varas longas de fibras mistas para molinetes", "Durante o dia", "Pesque em águas calmas e rasas, como aquários ou pequenos lagos. Use iscas pequenas e coloridas. Guppies são atraídos por movimentos sutis."],
  "Barracuda" => ["barracuda.png", "Plug", "Varas longas de fibras mistas para molinetes", "Manhã cedo e fim da tarde", "Pesque em águas costeiras e recifes. Barracudas são predadores rápidos, então use iscas que imitam peixes feridos e faça movimentos rápidos para atrair a atenção deles."]
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
    password: "password",
    name: Faker::Fantasy::Tolkien.character
  )

  user2 = User.create!(
    email: Faker::Internet.email,
    password: "password",
    name: Faker::Fantasy::Tolkien.character
  )

  region = Region.create!(
    name: Faker::Address.country,
    regionImage: regionImage.sample
  )

  spot1 = Spot.create!(
    longitude: Faker::Address.longitude,
    latitude: Faker::Address.latitude,
    name: beach_names.sample,
    region: region,
    spotImage: beachImages.sample,

  )
  spot2 = Spot.create!(
    longitude: Faker::Address.longitude,
    latitude: Faker::Address.latitude,
    name: beach_names.sample,
    region: region,
    spotImage: beachImages.sample,

  )

  fish = fish_names.to_a.sample

  fish1 = Fish.create!(
    name: fish[0],
    fishImage: fish[1][0],
    bait: fish[1][1],
    stick: fish[1][2],
    clue: fish[1][4],
    hour: fish[1][3],
  )

  fish = fish_names.to_a.sample

  fish2 = Fish.create!(
    name: fish[0],
    fishImage: fish[1][0],
    bait: fish[1][1],
    stick: fish[1][2],
    clue: fish[1][4],
    hour: fish[1][3],
  )

  fish_spot = FishesSpot.create!(
    spot_id: spot1.id,
    fish_id: fish1.id
  )

  fish_spot = FishesSpot.create!(
    spot_id: spot1.id,
    fish_id: fish2.id
  )

  fish_spot = FishesSpot.create!(
    spot_id: spot2.id,
    fish_id: fish1.id
  )

  fish_spot = FishesSpot.create!(
    spot_id: spot2.id,
    fish_id: fish2.id
  )

  user_spot = UserSpot.create!(
    user_id: user1.id,
    spot_id: spot1.id
  )

  user_spot = UserSpot.create!(
    user_id: user2.id,
    spot_id: spot1.id
  )

  user_spot = UserSpot.create!(
    user_id: user1.id,
    spot_id: spot2.id
  )

  user_spot = UserSpot.create!(
    user_id: user2.id,
    spot_id: spot2.id
  )
end
