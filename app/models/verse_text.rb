class VerseText < ApplicationRecord
  SUPPORTED_VERSIONS = {
    'en-asv' => 'American Standard Version',
    'en-t4t' => 'Translation for Translators',
    'en-bsb' => 'Berean Study Bible',
    'en-web' => 'World English Bible'
  }.freeze

  belongs_to :verse

  validates :version, presence: true, inclusion: { in: SUPPORTED_VERSIONS.keys }
  validates :version, uniqueness: { scope: :verse_id }
  validates :text, presence: true
end
