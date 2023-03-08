class Channel < ApplicationRecord
  has_many :issues, dependent: :destroy
end
