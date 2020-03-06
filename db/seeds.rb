# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

puts "Destroying all events"
Event.destroy_all
puts "Events : destroyed"

puts "Destroying all requests"
ContactRequest.destroy_all
puts "Requests : destroyed"

puts "Destroying all messages"
Message.destroy_all
puts "Messages : destroyed"

puts "Destroying all user_instruments"
UserInstrument.destroy_all
puts "User Instruments : destroyed"

puts "Destroying all photos"
User.all.each do |user|
  user.profile_picture.purge
end
User.destroy_all
puts "User : destroyed"

puts "Destroying all user_medias"
UserMedium.destroy_all
puts "User medias : destroyed"

puts "Destroying all Instruments"
Instrument.destroy_all
puts "Instruments : destroyed"

addresses = (75000..75020).to_a
addresses = addresses.map! { |i| i.to_s }

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
  "Hot Topic (song)"
  #{}"Hush, Little Baby",
  # "I've Been Everywhere",
  # "If I Had $1000000",
  # "It's Grim Up North",
  # "It's the End of the World as We Know It (And I Feel Fine)",
  # "Jung Talent Time",
  # "Life Is a Rock (But the Radio Rolled Me)",
  # "Lime Jello Marshmallow Cottage Cheese Surprise",
  # "Losing My Edge",
  # "Madamina, il catalogo è questo",
  # "Mediate (song)",
  # "Miracles (Insane Clown Posse song)",
  # "Moments to Remember",
  # "My Favorite Things (song)",
  # "Numb (U2 song)",
  # "One Night in Bangkok",
  # "The Pride (Five Finger Death Punch song)",
  # "The Pros and Cons of Hitch Hiking",
  # "Reasons to Be Cheerful, Part 3",
  # "Rocket (Def Leppard song)",
  # "(Get Your Kicks on) Route 66",
  # "Scarborough Fair (ballad)",
  # "Seasons of Love",
  # "Sixteen Reasons",
  # "Slow Train",
  # "Song for Whoever",
  # "Space Truckin'",
  # "Subterranean Homesick Blues",
  # "Summer Girls",
  # "Tchaikovsky (song)",
  # "Twelve Days of Christmas",
  # "La Vie Bohème",
  # "Vogue (Madonna song)",
  # "We Care a Lot (song)",
  # "We Didn't Start the Fire",
  # "You Can't Get a Man with a Gun",
  # "You're the Top"
  ]

url_array = [
  "https://www.youtube.com/watch?v=1c2u_g_KqSA",
  "https://www.youtube.com/watch?v=-dWVK96zsks",
  "https://www.youtube.com/watch?v=HSGJ-_yq0iE",
  "https://www.youtube.com/watch?v=AauPFv7K2G4",
  "https://www.youtube.com/watch?v=rkhaas7PW2U",
  "https://www.youtube.com/watch?v=HwW4LD3SJ4A",
  "https://www.youtube.com/watch?v=iZOb_NAMmQE",
  "https://www.youtube.com/watch?v=1BDBmDvyytA",
  "https://www.youtube.com/watch?v=EUE4D0IL9io",
  "https://www.youtube.com/watch?v=oIlXJ4bBjiE",
  "https://www.youtube.com/watch?v=gAW8ASOFIf8",
  "https://www.youtube.com/watch?v=JYsdLKpBmU8",
  "https://www.youtube.com/watch?v=kPZ0tQNfDqk",
  "https://www.youtube.com/watch?v=E6Vk_IZy-Sk",
  "https://www.youtube.com/watch?v=conOcxaxeqo",
  "https://www.youtube.com/watch?v=9J3WYCxUXRU",
  "https://www.youtube.com/watch?v=IuMuYzCkSaE",
  "https://www.youtube.com/watch?v=t32K3EfgxhY",
  "https://www.youtube.com/watch?v=CzQB73EGmJI",
  "https://www.youtube.com/watch?v=OBNNkFSeMKM",
  "https://www.youtube.com/watch?v=kBSOuD77q9A",
  "https://www.youtube.com/watch?v=mAuQwCM3nnI",
  "https://www.youtube.com/watch?v=pC4o7vHw1Fo",
  "https://www.youtube.com/watch?v=JdsafVzUBwM",
  "https://www.youtube.com/watch?v=EHk6DODhkGg",
  "https://www.youtube.com/watch?v=-O769Xdu9CU",
  "https://www.youtube.com/watch?v=vlZ9kjCrGJw",
  "https://www.youtube.com/watch?v=yHUSIzD1TIU",
  "https://www.youtube.com/watch?v=EE361vIGZ3Y"
  # "Hush, Little Baby",
  # "I've Been Everywhere",
  # "If I Had $1000000",
  # "It's Grim Up North",
  # "It's the End of the World as We Know It (And I Feel Fine)",
  # "Jung Talent Time",
  # "Life Is a Rock (But the Radio Rolled Me)",
  # "Lime Jello Marshmallow Cottage Cheese Surprise",
  # "Losing My Edge",
  # "Madamina, il catalogo è questo",
  # "Mediate (song)",
  # "Miracles (Insane Clown Posse song)",
  # "Moments to Remember",
  # "My Favorite Things (song)",
  # "Numb (U2 song)",
  # "One Night in Bangkok",
  # "The Pride (Five Finger Death Punch song)",
  # "The Pros and Cons of Hitch Hiking",
  # "Reasons to Be Cheerful, Part 3",
  # "Rocket (Def Leppard song)",
  # "(Get Your Kicks on) Route 66",
  # "Scarborough Fair (ballad)",
  # "Seasons of Love",
  # "Sixteen Reasons",
  # "Slow Train",
  # "Song for Whoever",
  # "Space Truckin'",
  # "Subterranean Homesick Blues",
  # "Summer Girls",
  # "Tchaikovsky (song)",
  # "Twelve Days of Christmas",
  # "La Vie Bohème",
  # "Vogue (Madonna song)",
  # "We Care a Lot (song)",
  # "We Didn't Start the Fire",
  # "You Can't Get a Man with a Gun",
  # "You're the Top"
  ]
# Creating Nick_name
puts 'Creating a user faker...'
40.times do
  pseudo_one = pseudo_array.sample
  pseudo_one = pseudo_one.truncate(10)
  number_rand = rand(0..10000)
  pseudo = "#{pseudo_one}#{number_rand}"
  address = addresses.sample
  genre_pref = Event::GENRE_ARRAY.sample
  user_age =rand(18..60)
  # profile = profile_array.sample

  user = User.new(
      last_name: Faker::Name.unique.name,
      first_name: Faker::Name.first_name,
      age: user_age,
      nick_name: pseudo,
      address: address,
      password: '123456',
      # profile_picture: '',
      email: Faker::Internet.email,
      genre_preferences: genre_pref,
      # profile_picture: profile
      )
  photo_user = User::PROFILE_ARRAY.sample
  puts photo_user
  file = URI.open(photo_user)
  user.profile_picture.attach(io: file, filename: "#{photo_user.slice(-8, -5)}.#{photo_user.last(3)}", content_type: "image/#{photo_user.last(3)}")
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
  event_type = Event::TYPE_EVENT_ARRAY.sample
  genre_pref = Event::GENRE_ARRAY.sample
  address = addresses.sample + ", Paris"
  song = song_array.sample
  instruments = Event::EVENT_INSTRUMENTS_ARRAY.sample(rand(1..3))
  event = Event.new(
    date: Faker::Date.forward(days: 30),
    location: address,
    title: ["Looking to practice ", "Looking to play ", "", ""].sample + song,
    event_type: event_type,
    duration: rand(1..15),
    genre: genre_pref,
    user: User.all.sample(1).first,
    instruments_array: instruments
    )
  event.save!
end

# User Media
puts "Creating User Media..."
x = 0
28.times do
  song_select = song_array[x]
  url_select = url_array[x]
  x += 1
  genre_pref = Event::GENRE_ARRAY.sample
  user_media = UserMedium.new(
    user: User.all.sample(1).first,
    title: song_select,
    music_genre: genre_pref,
    medium_type: ['video', 'song'].sample,
    url: url_select
    )
  user_media.save!
end

Event.all.each do |event|
  ContactRequest.create(
    user: event.user,
    event: event,
    instrument: Instrument.find_by(name: event.instruments_array.sample),
    status: 'Accepted'
  )
end

# Requests

# Messages

