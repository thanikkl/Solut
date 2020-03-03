class UserInstrument < ApplicationRecord
  belongs_to :user
  belongs_to :instrument
  INSTRUMENTS_ARRAY = [
    "Guitare",
    "Drums",
    "Piano",
    "Bass",
    "Triangle",
    "Maracass",
    "French Horn",
    "Keyboard",
    "Bass guitar",
    "Clavichord",
    "Violin",
    "Viola",
    "Cello",
    "Flute",
    "Trumpet",
    "Saxophone",
    "Clarinet",
    "Singing",
    "Organ",
    "Euphonium"
  ]
end
