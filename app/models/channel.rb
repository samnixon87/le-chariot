class Channel < ApplicationRecord
  before_save :add_slug
  has_many :issues, dependent: :destroy

  def to_param
    slug
  end

  def add_slug
    self.slug = name.downcase
  end
end
