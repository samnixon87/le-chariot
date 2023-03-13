class Channel < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
  has_many :issues, dependent: :destroy
end
