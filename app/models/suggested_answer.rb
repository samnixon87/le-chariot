class SuggestedAnswer < ApplicationRecord
  belongs_to :issue
  has_many :messages
end
