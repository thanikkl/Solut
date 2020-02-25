# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying all events"
Event.destroy_all
puts "Events : destroyed"

puts "Destroying all requests"
Request.destroy_all
puts "Requests : destroyed"

puts "Destroying all messages"
Message.destroy_all
puts "Messages : destroyed"

puts "destroying all users"
User.destroy_all
puts "Users : destroyed"

puts "Destroying all user_instruments"
UserInstrument.destroy_all
puts "User Instruments : destroyed"

puts "Destroying all user_medias"
UserMedium.destroy_all
puts "User medias : destroyed"

puts "Destroying all Instruments"
Instrument.destroy_all
puts "Instruments : destroyed"

addresses = [
  "16 Villa Gaudelet, Paris",
  "2 Rue d'Alexandrie, Paris",
  "11 Rue du Pot de Fer, Paris",
  "23 Rue Clapeyron, Paris",
  "4 Rue Lincoln, Paris",
  "12 Rue Saint-Jean-Baptiste de la Salle, Paris",
  "122 Boulevard Saint-Germain, Paris",
  "180bis Rue de Charenton, Paris",
  "Avenue Beaucour, 75008 Paris",
  "Avenue Boutroux, 75013 Paris",
  "Avenue Carnot, 75017 Paris",
  "Avenue Cartellier, 75020 Paris",
  "Avenue Charles-de-Foucauld, 75012 Paris",
  "Avenue Charles-Floquet, 75007 Paris",
  "Avenue Charles-Girault, 75008 Paris",
  "Avenue Charles-Risler, 75007 Paris",
  "Avenue Claude-Regaud, 75013 Paris",
  "Avenue Claude-Vellefaux, 75010 Paris",
  "Avenue Constant-Coquelin, 75007 Paris",
  "Avenue Corentin-Cariou, 75019 Paris",
  "Avenue Courteline, 75012 Paris",
  "Avenue Daniel-Lesueur, 75007 Paris",
  "Avenue Daumesnil, 75012 Paris",
  "Avenue David-Weill, 75014 Paris",
  "Avenue de Boufflers, 75116 Paris",
  "Avenue de Bouvines, 75011 Paris",
  "Avenue de Breteuil, 75007 Paris",
  "Avenue de Champaubert, 75015 Paris",
  "Avenue de Choisy, 75013 Paris",
  "Avenue de Clichy, 75017 Paris",
  "Avenue de Corbera, 75012 Paris",
  "Avenue de Flandre, 75019 Paris",
  "Avenue de Fontenay, 75012 Paris",
  "Avenue de France, 75013 Paris",
  "Avenue de Friedland, 75008 Paris",
  "Avenue de Gravelle, 75012 Paris",
  "Avenue de Joinville, 75012 Paris",
  "Place Jules-Joffrin, 75018 Paris",
  "Place Jules-Renard, 75017 Paris",
  "Place Jules-Senard, 75019 Paris",
  "Place Jussieu, 75005 Paris",
  "Place Justin Godart, 75006 Paris",
  "Place Kossuth, 75009 Paris",
  "Place Lachambeaudie, 75012 Paris",
  "Place Le Corbusier, 75006 Paris",
  "Place Léon-Paul-Fargue, 75006 Paris",
  "Place Léonard-Bernstein, 75012 Paris",
  "Place Lili-Boulanger, 75009 Paris",
  "Place Lino Ventura, 75009 Paris",
  "Place Louis Bernier, 75017 Paris",
  "Place Louis-Armand, 75015 Paris",
  "Place Louis-Armstrong, 75013 Paris",
  "Place Louis-Lépine, 75004 Paris",
  "Place Louis-Marin, 75005 Paris",
  "Place Lucien-Herr 75005 Paris",
  "Place Madeleine Renaud et Jean Louis Barrault, 75015 Paris",
  "Place Marc-Bloch, 75020 Paris",
  "Place Marcel Cerdan, 75015 Paris",
  "Place Marcel Paul, 75014 Paris",
  "Place Marcel-Achard, 75019 Paris",
  "Place Marcelin-Berthelot, 75005 Paris",
  "Place Marguerite-de-Navarre, 75001 Paris",
  "Place Maria-Callas, 75116 Paris",
  "Place Marie-de-Miribel, 75020 Paris",
  "Place Marie-Madeleine-Fourcade, 75015 Paris",
  "Place Marlène Dietrich, 75116 Paris",
  "Place Martin-Nadaud, 75020 Paris",
  "Place Maubert, 75005 Paris",
  "Place Maurice Audin, 75005 Paris",
  "Place Maurice-Chevalier, 75020 Paris",
  "Place Maurice-de-Fontenay, 75012 Paris",
  "Place Maurice-Quentin, 75001 Paris",
  "Place Mazas, 75012 Paris",
  "Place Mehdi Ben Barka, 75006 Paris",
  "Place Michel Petrucciani, 75018 Paris",
  "Place Michel-Audiard, 75014 Paris",
  "Rue Bouchardon, 75010 Paris",
  "Rue Boucher, 75001 Paris",
  "Rue Bouchut, 75015 Paris",
  "Rue Boucry, 75018 Paris",
  "Rue Boudreau, 75009 Paris",
  "Rue Bougainville, 75007 Paris",
  "Rue Bouilloux-Lafont, 75015 Paris",
  "Rue Boulard, 75014 Paris",
  "Rue Boulay, 75017 Paris",
  "Rue Boulitte, 75014 Paris",
  "Rue Boulle, 75011 Paris",
  "Rue Bourdaloue, 75009 Paris",
  "Rue Bouret, 75019 Paris",
  "Rue Bourgon, 75013 Paris",
  "Rue Boursault, 75017 Paris",
  "Rue Bourseul, 75015 Paris",
  "Rue Boussingault, 75013 Paris",
  "Rue Boutarel, 75004 Paris",
  "Rue Boutebrie, 75005 Paris",
  "Rue Bouvier, 75011 Paris",
  "Rue Boy-Zelenski, 75010 Paris",
  "Rue Boyer, 75020 Paris",
  "Rue Boyer-Barret, 75014 Paris",
  "Rue Brahms, 75012 Paris",
  "Rue Brancion, 75015 Paris",
  "Rue Brémontier, 75017 Paris",
  "Rue Bretonneau, 75020 Paris",
  "Rue Brey, 75017 Paris",
  "Rue Bridaine, 75017 Paris",
  "Rue Brignole, 75116 Paris",
  "Rue Brillat-Savarin, 75013 Paris",
  "Rue Briquet, 75018 Paris",
  "Rue Broca, 75005 Paris",
  "Rue Brochant, 75017 Paris",
  "Rue Brongniart, 75002 Paris",
  "Rue Broussais, 75014 Paris",
  "Rue Bruant, 75013 Paris",
  "Rue Bruller, 75014 Paris",
  "Rue Brunel, 75017 Paris",
  "Rue Bruneseau, 75013 Paris",
  "Rue Buffault, 75009 Paris",
  "Rue Buffon, 75005 Paris",
  "Rue Buot, 75013 Paris"
]

pseudo_array =
    [
    Faker::Name.first_name.tr(" ", "_"),
    Faker::TvShows::Stargate.planet.tr(" ", "_"),
    Faker::TvShows::StarTrek.character.tr(" ", "_"),
    Faker::TvShows::StarTrek.specie.tr(" ", "_"),
    Faker::TvShows::Simpsons.character.tr(" ", "_"),
    Faker::Music::RockBand.name.tr(" ", "_"),
    Faker::Music.band.tr(" ", "_")
    ]

song_array = [
  "7 Things",
  "50 Ways to Leave Your Lover",
  "88 Lines About 44 Women",
  "1985 (song)",
  "'A' You're Adorable",
  "All I Really Want to Do",
  "Amerikan Music",
  "At the Hop",
  "Back to the 80s (song)",
  "The Bad Touch",
  "Billionaire (song)",
  "Calendar Girl (song)",
  "Can U Dig It?",
  "Catalogue Aria",
  "Dayenu",
  "Destroy Rock & Roll (song)",
  "Dig It (Beatles song)",
  "Do You Remember These",
  "¿Dónde Estás Corazón?",
  "The Elements (song)",
  "Endless Art",
  "Gin Soaked Boy",
  "God (John Lennon song)",
  "Gotta Serve Somebody",
  "Green Grow the Rushes, O",
  "A Hard Rain's a-Gonna Fall",
  "The Heart of Rock & Roll",
  "Hello (The Beloved song)",
  "Hit Me with Your Rhythm Stick",
  "Hot Topic (song)",
  "Hush, Little Baby",
  "I've Been Everywhere",
  "If I Had $1000000",
  "It's Grim Up North",
  "It's the End of the World as We Know It (And I Feel Fine)",
  "Jung Talent Time",
  "Life Is a Rock (But the Radio Rolled Me)",
  "Lime Jello Marshmallow Cottage Cheese Surprise",
  "Losing My Edge",
  "Madamina, il catalogo è questo",
  "Mediate (song)",
  "Miracles (Insane Clown Posse song)",
  "Moments to Remember",
  "My Favorite Things (song)",
  "Numb (U2 song)",
  "One Night in Bangkok",
  "The Pride (Five Finger Death Punch song)",
  "The Pros and Cons of Hitch Hiking",
  "Reasons to Be Cheerful, Part 3",
  "Rocket (Def Leppard song)",
  "(Get Your Kicks on) Route 66",
  "Scarborough Fair (ballad)",
  "Seasons of Love",
  "Sixteen Reasons",
  "Slow Train",
  "Song for Whoever",
  "Space Truckin'",
  "Subterranean Homesick Blues",
  "Summer Girls",
  "Tchaikovsky (song)",
  "Twelve Days of Christmas",
  "La Vie Bohème",
  "Vogue (Madonna song)",
  "We Care a Lot (song)",
  "We Didn't Start the Fire",
  "You Can't Get a Man with a Gun",
  "You're the Top"
  ]

# Creating Nick_name
puts 'Creating a user faker...'
100.times do
  pseudo_one = pseudo_array.sample
  number_rand = rand(0..99)
  pseudo = "#{pseudo_one}#{number_rand}"
  address = addresses.sample
  genre_pref = Event::GENRE_ARRAY.sample
  user_age =rand(18..60)

  user = User.new(
      last_name: Faker::Name.unique.name,
      first_name: Faker::Name.first_name,
      age: user_age,
      nick_name: pseudo,
      address: address,
      password: 'solutsolut',
      profile_picture: '',
      email: Faker::Internet.email,
      genre_preferences: genre_pref
      )
  user.save!
end

# Creating Instruments
puts "Creating Instruments..."
UserInstrument::INSTRUMENTS_ARRAY.each do |instrument|
  instrument = Instrument.new(
  name: instrument
  )
  instrument.save!
end

# Creating User Instruments
number_of_users = User.count
puts "Creating User Instruments..."
number_of_users.times do
  user_instrument = UserInstrument.new(
    user: User.all.sample(1).first,
    proficiency: ['beginner', 'advanced', 'professional'].sample,
    instrument: Instrument.all.sample(1).first
    )
  user_instrument.save!
end

# # Creating Events
puts "Creating Events..."
number_of_users.times do
  genre_pref = Event::GENRE_ARRAY.sample
  address = addresses.sample
  song = song_array.sample
  event = Event.new(
    date: Faker::Date.forward(days: 30),
    location: address,
    capacity: rand(1..5),
    title: song,
    event_type: "Event type",
    duration: rand(1..15),
    genre: genre_pref,
    user: User.all.sample(1).first
    )
  event.save!
end

# User Media
puts "Creating User Media..."
number_of_users.times do
  genre_pref = Event::GENRE_ARRAY.sample
  user_media = UserMedium.new(
    user: User.all.sample(1).first,
    title: "Baby Sharky Song",
    music_genre: genre_pref,
    medium_type: ['video', 'song'].sample
    )
  user_media.save!
end

# Requests

# Messages

