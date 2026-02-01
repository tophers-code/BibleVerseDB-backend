class VerseReference < ApplicationRecord
  belongs_to :verse
  belongs_to :referenced_verse, class_name: 'Verse'

  validates :verse_id, uniqueness: { scope: :referenced_verse_id }
  validate :cannot_reference_self

  private

  def cannot_reference_self
    if verse_id == referenced_verse_id
      errors.add(:referenced_verse_id, "cannot reference itself")
    end
  end
end
