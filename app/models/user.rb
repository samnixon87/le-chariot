class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :issues, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :favourite_messages, through: :favourites, source: :message
end
