class VerseCategory < ApplicationRecord
  belongs_to :verse
  belongs_to :category

  validates :verse_id, uniqueness: { scope: :category_id }
end
