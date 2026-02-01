class ProgressionStep < ApplicationRecord
  belongs_to :verse_progression
  belongs_to :verse

  validates :step_order, presence: true, numericality: { greater_than: 0 }
  validates :step_order, uniqueness: { scope: :verse_progression_id }
end
