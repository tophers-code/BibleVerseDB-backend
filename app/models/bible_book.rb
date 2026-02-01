class BibleBook < ApplicationRecord
  enum :testament, { old_testament: 0, new_testament: 1 }

  has_many :verses, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :abbreviation, presence: true
  validates :testament, presence: true
  validates :book_order, presence: true, uniqueness: true
  validates :chapter_count, presence: true, numericality: { greater_than: 0 }

  default_scope { order(:book_order) }
end
