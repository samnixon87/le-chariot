class Issue < ApplicationRecord
  belongs_to :user
  belongs_to :channel
  has_many :suggested_answers, dependent: :destroy
  has_many :messages, dependent: :destroy
end
