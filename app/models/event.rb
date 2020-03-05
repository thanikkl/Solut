class Event < ApplicationRecord
  belongs_to :user
  has_many :contact_requests, dependent: :destroy
  has_many :users, through: :contact_requests
  GENRE_ARRAY = ["Disco", "Blues", "Funk", "Jazz", "Metal", "Pop", "Punk", "Rap", "Rock", "Country", "Reggae", "Gospel", "Soul", "Kompa", "Classic"]
  TYPE_EVENT_ARRAY = ['Play together', 'Learn together']
  EVENT_INSTRUMENTS_ARRAY = ["Guitare", "Drums", "Piano", "Bass", "Maracass", "Keyboard", "Bass guitar", "Violin", "Viola", "Cello", "Flute", "Trumpet", "Saxophone", "Singing"]
  # Version some choice
  #EVENT_INSTRUMENTS_ARRAY1 = ["Guitare", "Drum", "Piano", "Bass", "Triangle", "Maracass"]
  #EVENT_INSTRUMENTS_ARRAY2 = ["Guitare1", "Drum2", "Piano3", "Bass4", "Triangle5", "Maracass6"]
  # Version all choice 36 sur 48
  # EVENT_INSTRUMENTS_ARRAY1 = ["Guitare", "Drum", "Piano", "Bass", "Triangle", "Maracass", "Guitare", "Drum", "Piano", "Bass", "Triangle", "Maracass", "Guitare", "Drum", "Piano", "Bass", "Triangle", "Maracass"]
  # EVENT_INSTRUMENTS_ARRAY2 = ["Guitare1", "Drum2", "Piano3", "Bass4", "Triangle5", "Maracass6", "Guitare1", "Drum2", "Piano3", "Bass4", "Triangle5", "Maracass6", "Guitare1", "Drum2", "Piano3", "Bass4", "Triangle5", "Maracass6"]
  # Version mix
  EVENT_INSTRUMENTS_ARRAY1 = ["Guitare", "Drums", "Piano", "Bass", "Maracass", "Keyboard", "Singing"]
  EVENT_INSTRUMENTS_ARRAY2 = ["Violin", "Viola", "Cello", "Flute", "Trumpet", "Saxophone", "Bass guitar"]

# "Accordion",
# "Bagpipes",
# "Banjo",
# "Bass guitar",
# "Bassoon",
# "Cello",
# "Clarinet",
# "Clavichord",
# "Cornet",
# "Cymbal",
# "Dhime",
# "Didgeridoo",
# "Double bass",
# "Drum",
# "Flute",
# "French horn",
# "Glass harmonica",
# "Glockenspiel",
# "Gong",
# "Guitar",
# "Harmonica",
# "Harp",
# "Mandolin",
# "Marimba",
# "Melodica",
# "Oboe",
# "Octobass",
# "Organ",
# "Pan Pipes",
# "Panduri",
# "Piano",
# "Recorder",
# "Saxophone",
# "Sitar",
# "Steelpan",
# "Synthesizer",
# "Tambourine",
# "Triangle",
# "Trombone",
# "Trumpet",
# "Tuba",
# "Ukulele",
# "Viola",
# "Violin",
# "Vocal cords",
# "Xylophone",
# "Zither"

# 47 instruments
  after_create :reject_empty_element

  def reject_empty_element
    reject = self.instruments_array.reject(&:empty?)
    self.update(instruments_array: reject)
  end

  def participants
    self.contact_requests.where(status: 'Accepted').map(&:user)
  end

  def places_left
    self.instruments_array.count - self.users.count
  end

  def available_instruments
    self.instruments_array - self.contact_requests.where(status: 'Accepted').map { |request| request.instrument.name }
  end

end
