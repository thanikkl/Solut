class ContactRequest < ApplicationRecord
  belongs_to :instrument
  belongs_to :user
  belongs_to :event

  validates :event_id, uniqueness: { scope: :user_id }

  has_many :messages, dependent: :destroy

end
