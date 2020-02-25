class Event < ApplicationRecord
  belongs_to :user
  has_many :requests, dependent: :destroy
  GENRE_ARRAY = ["Disco", "Blues", "Funk", "Jazz", "Metal", "Pop", "Punk", "Rap", "Rock", "Country", "Reggae", "Gospel", "Soul", "Kompa", "Classic"]
  TYPE_EVENT_ARRAY = ['Play together', 'Learn together']
end
