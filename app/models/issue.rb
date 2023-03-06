class Issue < ApplicationRecord
  belongs_to :user, :channel
  has_many :suggested_answers
end
