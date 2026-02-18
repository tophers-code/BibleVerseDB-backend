class VerseTag < ApplicationRecord
  belongs_to :verse
  belongs_to :tag

  validates :tag_id, uniqueness: { scope: :verse_id }
end
