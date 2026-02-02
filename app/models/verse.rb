class Verse < ApplicationRecord
  belongs_to :bible_book

  has_many :verse_categories, dependent: :destroy
  has_many :categories, through: :verse_categories

  has_many :outgoing_references, class_name: 'VerseReference', foreign_key: :verse_id, dependent: :destroy
  has_many :incoming_references, class_name: 'VerseReference', foreign_key: :referenced_verse_id, dependent: :destroy
  has_many :referenced_verses, through: :outgoing_references
  has_many :referencing_verses, through: :incoming_references, source: :verse

  has_many :progression_steps, dependent: :destroy
  has_many :verse_progressions, through: :progression_steps

  validates :chapter, presence: true, numericality: { greater_than: 0 }
  validates :verse_start, presence: true, numericality: { greater_than: 0 }
  validates :verse_end, numericality: { greater_than_or_equal_to: :verse_start }, allow_nil: true
  validates :bible_book_id, uniqueness: { scope: [:chapter, :verse_start, :verse_end] }

  def reference
    verse_text = verse_end.present? && verse_end != verse_start ? "#{verse_start}-#{verse_end}" : verse_start.to_s
    "#{bible_book.name} #{chapter}:#{verse_text}"
  end
end
