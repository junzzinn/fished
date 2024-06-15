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
  "Barracuda" => ["barracuda.png", "Plug", "Varas longas de fibras mistas para molinetes", "Manhã cedo e fim da tarde", "Pesque em águas costeiras e recifes. Barracudas são predadores rápidos, então use iscas que imitam peixes feridos e faça movimentos rápidos para atrair a atenção deles."],
  "Marlin" => ["marlin.png", "Cebo grande", "Varas telescópicas de fibra para pesca em alto mar", "Manhã cedo", "Pesque em alto mar, principalmente em áreas tropicais e subtropicais. Use iscas grandes e pesque durante a manhã para melhores resultados."],
  "Trout" => ["trout.png", "Fly", "Vara de mosca", "Manhã cedo ou fim da tarde", "Pesque em rios de água doce com correnteza moderada. Use iscas que imitam insetos aquáticos e varie a técnica para encontrar a mais eficaz."],
  "Swordfish" => ["swordfish.png", "Cebo grande", "Varas para pesca de mar profundo", "Noite", "Pesque em alto mar durante a noite. Use iscas grandes e vivas, como lulas, e esteja preparado para uma batalha longa e desafiadora."],
  "Pike" => ["pike.png", "Spinnerbait", "Varas de fibra de vidro para molinetes", "Manhã cedo e fim da tarde", "Pesque em lagos e rios de água doce. Use iscas que imitam peixes pequenos e pesque perto de vegetação aquática."],
  "Bass" => ["bass.png", "Minnow", "Varas telescópicas de fibra", "Manhã cedo e fim da tarde", "Pesque em lagos de água doce. Use iscas que imitam peixes pequenos e pesque perto de estruturas submersas, como troncos e rochas."],
  "Snapper" => ["snapper.png", "Pedaços de peixe", "Varas longas de fibras mistas para molinetes", "Manhã cedo e fim da tarde", "Pesque em águas costeiras e recifes. Use pedaços de peixe como isca e pesque perto de estruturas submersas."],
  "Perch" => ["perch.png", "Vermes", "Varas longas de fibras mistas para molinetes", "Durante o dia", "Pesque em lagos e rios de água doce. Use vermes ou larvas como isca e pesque perto do fundo em áreas com vegetação aquática."],
  "Cod" => ["cod.png", "Jigging", "Varas telescópicas de fibra", "Manhã cedo e fim da tarde", "Pesque em águas profundas, principalmente no inverno. Use iscas artificiais pesadas e pesque perto do fundo."]
}

data_region = {
  "California, USA": [
    {
      "longitude": -118.4956,
      "latitude": 34.0195,
      "name": "Santa Monica Beach",
      "spotImage": "https://images.squarespace-cdn.com/content/v1/5e0e65adcd39ed279a0402fd/1627422660659-9OVR59J3GP5NLGME3K9Z/5.jpg?format=2500w"
    },
    {
      "longitude": -118.4741,
      "latitude": 33.9850,
      "name": "Venice Beach",
      "spotImage": "https://a.cdn-hotels.com/gdcs/production103/d1593/995f6282-43fe-464d-ba3d-2b646a8f7ec3.jpg"
    },
    {
      "longitude": -118.7798,
      "latitude": 34.0259,
      "name": "Malibu Beach",
      "spotImage": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaALwDTjiOPNTrDFhuN3lp_QY3UDQ1nRRJrQ&s"
    }
  ],
  "Queensland, Australia": [
    {
      "longitude": 153.4298,
      "latitude": -28.0023,
      "name": "Surfers Paradise Beach",
      "spotImage": "https://aquariustraveller.com/wp-content/uploads/2020/06/P1012932.jpg"
    },
    {
      "longitude": 149.0350,
      "latitude": -20.2820,
      "name": "Whitehaven Beach",
      "spotImage": "https://static.ffx.io/images/$zoom_0.054%2C$multiply_0.7725%2C$ratio_1.5%2C$width_756%2C$x_0%2C$y_1/t_crop_custom/q_86%2Cf_auto/0f314b8ae42828b1b614b1808a2b8fbe5f5f6062"
    },
    {
      "longitude": 153.4515,
      "latitude": -28.0967,
      "name": "Burleigh Heads Beach",
      "spotImage": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCskZirCb6Ey2uEIRELupn1b1XR0kfu3A5uA&s"
    }
  ],
  "Hawaii, USA": [
    {
      "longitude": -157.8424,
      "latitude": 21.2767,
      "name": "Waikiki Beach",
      "spotImage": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2a/b2/2e/3e/exterior.jpg?w=700&h=-1&s=1"
    },
    {
      "longitude": -157.7278,
      "latitude": 21.3936,
      "name": "Lanikai Beach",
      "spotImage": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-Z7SL1HgrTlaFy85DMzq7lMwPBtRQ33Mbsg&s"
    },
    {
      "longitude": -157.6813,
      "latitude": 21.2838,
      "name": "Hanauma Bay",
      "spotImage": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTd5b633IgMETyqSu_-Rl0UR_Xm_ztnk8L5ow&s"
    }
  ],
  "Bali, Indonesia": [
    {
      "longitude": 115.1698,
      "latitude": -8.7178,
      "name": "Kuta Beach",
      "spotImage": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSj2E79mDPK6oMS_xcHXi8TynVLiVPe2DT28g&s"
    },
    {
      "longitude": 115.2315,
      "latitude": -8.8024,
      "name": "Nusa Dua Beach",
      "spotImage": "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2c/22/de/40/exterior.jpg?w=700&h=-1&s=1"
    },
    {
      "longitude": 115.1573,
      "latitude": -8.7731,
      "name": "Jimbaran Beach",
      "spotImage": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz06jmZeW2uN5lgXlRWBBYrBqYtGeiNuqNog&s"
    }
  ],
  "Florida, USA": [
    {
      "longitude": -80.1300,
      "latitude": 25.7907,
      "name": "South Beach",
      "spotImage": "https://visitsouthbeachonline.com/wp-content/uploads/2022/12/qtq80-swNLQV.jpeg"
    },
    {
      "longitude": -82.8271,
      "latitude": 27.9778,
      "name": "Clearwater Beach",
      "spotImage": "https://www.visitstpeteclearwater.com/sites/default/files/styles/large_horizontal_wide/public/2021-03/vspc21_clearwaterbeach_preview.jpg?h=a27784c6&itok=VNhhXcZu"
    },
    {
      "longitude": -82.5603,
      "latitude": 27.2671,
      "name": "Siesta Key Beach",
      "spotImage": "https://res.cloudinary.com/sagacity/image/upload/c_crop,h_2813,w_5000,x_0,y_0/c_limit,dpr_auto,f_auto,fl_lossy,q_80,w_1080/shutterstock_2414094545_u3g3g3.jpg"
    }
  ],
  "Bahia, Brazil": [
    {
      "longitude": -38.5077,
      "latitude": -13.0122,
      "name": "Porto da Barra Beach",
      "spotImage": "https://www.costadosauipe.com.br/images/news/0478/porto_da_barra_1_1.jpg"
    },
    {
      "longitude": -38.0005,
      "latitude": -12.5763,
      "name": "Praia do Forte",
      "spotImage": "https://www.melhoresdestinos.com.br/wp-content/uploads/2022/05/praia-do-forte-capa-3.jpg"
    },
    {
      "longitude": -38.9191,
      "latitude": -13.3795,
      "name": "Morro de São Paulo",
      "spotImage": "https://www.viagenscinematograficas.com.br/wp-content/uploads/2017/02/Morro-de-SP-Melhores-Praias-28.jpg"
    }
  ],
  "Canary Islands, Spain": [
    {
      "longitude": -16.2498,
      "latitude": 28.4949,
      "name": "Playa de las Teresitas",
      "spotImage": "https://www.hellocanaryislands.com/sites/default/files/styles/masonry_image/public/resources/resource_image/PLaya-Teresitas_002-gal_0.jpg?itok=zvcGHBrM"
    },
    {
      "longitude": -15.5704,
      "latitude": 27.7573,
      "name": "Playa del Inglés",
      "spotImage": "https://www.grancanaria.com/turismo/fileadmin/diseno2014/img/playas/cabeceras_estaticas/playa_del_ingles_v3.jpg"
    },
    {
      "longitude": -15.5856,
      "latitude": 27.7412,
      "name": "Maspalomas Beach",
      "spotImage": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDSW1ZuXzs1YW-k3twt3X2NIDhxHHn15XNng&s"
    }
  ],
  "Phuket, Thailand": [
    {
      "longitude": 98.2926,
      "latitude": 7.8966,
      "name": "Patong Beach",
      "spotImage": "https://cdn-5d68e683f911c80950255463.closte.com/wp-content/uploads/2023/03/diamondcliff-blog-090323.jpg"
    },
    {
      "longitude": 98.2985,
      "latitude": 7.8211,
      "name": "Kata Beach",
      "spotImage": "https://www.sugarmarinahotel.com/wp-content/uploads/2023/10/hotels-in-kata-beach.jpg"
    },
    {
      "longitude": 98.3023,
      "latitude": 7.8504,
      "name": "Karon Beach",
      "spotImage": "https://content.phuket101.net/wp-content/uploads/20220123174347/karon-beach-phuket.jpg"
    }
  ],
  "Maldives": [
    {
      "longitude": 73.5235,
      "latitude": 4.2125,
      "name": "Hulhumale Beach",
      "spotImage": "https://img.traveltriangle.com/blog/wp-content/uploads/2020/02/cover-Places-to-Visit-in-Hulhumale.jpg"
    },
    {
      "longitude": 73.4234,
      "latitude": 4.1742,
      "name": "Bikini Beach",
      "spotImage": "https://pix10.agoda.net/hotelImages/161/161631/161631_17010617170050177698.jpg?ca=6&ce=1&s=702x392"
    },
    {
      "longitude": 73.2207,
      "latitude": 4.6056,
      "name": "Veligandu Island Beach",
      "spotImage": "https://d2qwq69i2ic1pk.cloudfront.net/2020/03/Veligandu_ArielView1_800x450.jpg"
    }
  ],
  "Riviera Maya, Mexico": [
    {
      "longitude": -87.0623,
      "latitude": 20.6305,
      "name": "Playa del Carmen",
      "spotImage": "https://www.kayak.com.br/rimg/dimg/78/70/001b704a-city-15939-1629b33a69c.jpg?width=1366&height=768&xhint=1779&yhint=1365&crop=true"
    },
    {
      "longitude": -87.4519,
      "latitude": 20.2110,
      "name": "Tulum Beach",
      "spotImage": "https://lp-cms-production.imgix.net/2021-08/Playa_Ruinas_Tulum.jpg?auto=format&q=75&w=1920"
    },
    {
      "longitude": -87.3157,
      "latitude": 20.4017,
      "name": "Akumal Beach",
      "spotImage": "https://www.playadelcarmen.com/blog/wp-content/uploads/akumal-e1533057126498.jpg"
    }
  ]
}

beachImages = ["https://www.viagenscinematograficas.com.br/wp-content/uploads/2014/11/Melhores-Praias-do-Rio.jpg", "https://static.ndmais.com.br/2022/11/prainha-800x534.jpg", "https://blog.maxmilhas.com.br/wp-content/uploads/2019/06/Praia-do-Forno-Arraial-dAjuda.jpg", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlFYawERCWlbDWBuW-eSyJMKcrXHIafeFHo_OL4-0fWA&s", "https://www.cvc.com.br/dicas-de-viagem/wp-content/uploads/2021/10/8-melhores-praias-da-regiao-dos-lagos-no-rio-de-janeiro-1170x650.png"]
regionImage = {
  "California, USA": "https://www.visittheusa.com/sites/default/files/styles/state_hero_l/public/images/hero_media_image/2017-05/a9f350f3face34b87e18a858c3d53dae.jpeg?h=4ebd21dc&itok=mYIuSukl",
  "Queensland, Australia": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx67tb-3cloQQZ-XH1Prdwq7CKDidDZtJLGg&s",
  "Hawaii, USA": "https://p-airnz.com/cms/assets/Common-Assets/Destination-Images/united-states-hawaii-city-beach-2100x1400__ScaleMaxWidthWzkzMF0.jpg",
  "Bali, Indonesia": "https://litoral-verde.s3.sa-east-1.amazonaws.com/wp-content/uploads/2023/01/03150144/Bali-1.jpg",
  "Florida, USA": "https://www.nationsonline.org/gallery/USA/Ocean-Drive,-Art-Deco-District,-Miami-Beach.jpg",
  "Bahia, Brazil": "https://i0.wp.com/brazilbeyondrio.com/wp-content/uploads/2018/08/salvadorelevadorlacerda.jpg?resize=640%2C480&ssl=1",
  "Canary Islands, Spain": "https://www.winetraveler.com/wp-content/uploads/2021/04/visiting-the-canary-islands-travel-resources-spain.jpg",
  "Phuket, Thailand": "https://cache.marriott.com/content/dam/marriott-digital/mc/apec/hws/h/hktmb/en_us/photo/unlimited/assets/mc-hktmb-exterior---aerial-v29522-56401.jpg",
  "Maldives": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJ40V1TPWLHb2agkkzoES36_DCqYvtV1-9tg&s",
  "Riviera Maya, Mexico": "https://www.delphinusworld.com/hubfs/Portada_Riviera%20Maya.jpg"
}
beach_names = [
  "Sunny Beach",
  "Paradise Cove",
  "Golden Sands",
  "Coral Bay",
  "Blue Lagoon"
]

data_region.each do |region_name, beach_list|
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
    name: region_name,
    regionImage: regionImage[region_name]
  )

  beach_list.each do |beach|
    spot1 = Spot.create!(
      longitude: beach[:longitude],
      latitude: beach[:latitude],
      name: beach[:name],
      region: region,
      spotImage: beach[:spotImage],
    )
    user_spot = UserSpot.create!(
      user_id: user1.id,
      spot_id: spot1.id
    )

    user_spot = UserSpot.create!(
      user_id: user2.id,
      spot_id: spot1.id
    )
    5.times do
      fish = fish_names.to_a.sample

      fish1 = Fish.create!(
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

    end
  end
end
