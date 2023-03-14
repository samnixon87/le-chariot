class Issue < ApplicationRecord
  include PgSearch::Model

  has_rich_text :description
  has_rich_text :code_block

  belongs_to :user
  belongs_to :channel
  has_many :suggested_answers, dependent: :destroy
  has_many :messages, dependent: :destroy

  pg_search_scope :search_by_title_and_description,
                  against: %i[title description],
                  using: { tsearch: { prefix: true } }

  validates :title, presence: true
  validates :content, presence: true

end
