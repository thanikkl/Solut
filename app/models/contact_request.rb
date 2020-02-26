class ContactRequest < ApplicationRecord
  belongs_to :instrument
  belongs_to :user
  belongs_to :event

  has_many :messages, dependent: :destroy

end
