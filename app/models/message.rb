class Message < ApplicationRecord
  belongs_to :user
  belongs_to :contact_request
end
