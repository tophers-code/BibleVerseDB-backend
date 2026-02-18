class Tag < ApplicationRecord
  has_many :verse_tags, dependent: :destroy
  has_many :verses, through: :verse_tags

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  before_save { self.name = name.downcase.strip }
end
