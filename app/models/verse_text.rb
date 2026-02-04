class VerseText < ApplicationRecord
  SUPPORTED_VERSIONS = {
    'esv' => 'English Standard Version',
    'nlt' => 'New Living Translation',
    'niv' => 'New International Version',
    'nasb' => 'New American Standard Bible',
    'csb' => 'Christian Standard Bible',
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
