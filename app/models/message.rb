class Message < ApplicationRecord
  belongs_to :user
  belongs_to :issue
  has_many :favourites, dependent: :destroy
  has_many :fans, through: :favourites, source: :user
end
