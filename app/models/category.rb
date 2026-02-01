class Category < ApplicationRecord
  has_many :verse_categories, dependent: :destroy
  has_many :verses, through: :verse_categories

  validates :name, presence: true, uniqueness: true
  validates :meaning, presence: true
  validates :color_code, presence: true

  default_scope { order(:name) }
end
