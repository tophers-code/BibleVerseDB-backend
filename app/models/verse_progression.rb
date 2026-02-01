class VerseProgression < ApplicationRecord
  has_many :progression_steps, -> { order(:step_order) }, dependent: :destroy
  has_many :verses, through: :progression_steps

  validates :name, presence: true, uniqueness: true
end
