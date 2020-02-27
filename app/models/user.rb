class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_media, dependent: :destroy
  has_many :user_instruments
  has_many :instruments, through: :user_instruments
  has_many :events, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :contact_requests, dependent: :destroy
  has_one_attached :profile_picture

 end
