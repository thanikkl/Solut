class UserInstrument < ApplicationRecord
  belongs_to :user
  belongs_to :instrument
  INSTRUMENTS_ARRAY = [
    "Guitare",
    "Drum",
    "Piano",
    "Bass",
    "Triangle",
    "Maracass"
  ]
end
