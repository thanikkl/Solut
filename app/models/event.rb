class Event < ApplicationRecord
  belongs_to :user
  has_many :contact_requests, dependent: :destroy
  GENRE_ARRAY = ["Disco", "Blues", "Funk", "Jazz", "Metal", "Pop", "Punk", "Rap", "Rock", "Country", "Reggae", "Gospel", "Soul", "Kompa", "Classic"]
  TYPE_EVENT_ARRAY = ['Play together', 'Learn together']
  EVENT_INSTRUMENTS_ARRAY = ["Guitare", "Drum", "Piano", "Bass", "Triangle", "Maracass"]

  after_create :reject_empty_element

  def reject_empty_element
    reject = self.instruments_array.reject(&:empty?)
    self.update(instruments_array: reject)
  end

end
