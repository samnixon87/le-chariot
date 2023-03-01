class Issue < ApplicationRecord
  belongs_to :user
  belongs_to :channel
  has_many :suggested_answers, dependent: :destroy
end
