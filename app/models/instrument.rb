class Instrument < ApplicationRecord
  has_many :user_instruments
  has_many :users, through: :user_instruments
  has_many :contact_requests
end
