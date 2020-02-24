class Instrument < ApplicationRecord
  has_many :users, through: :user_instruments
  has_many :requests
end
