class CreateVerseTexts < ActiveRecord::Migration[8.0]
  def change
    create_table :verse_texts do |t|
      t.references :verse, null: false, foreign_key: true
      t.string :version, null: false
      t.text :text

      t.timestamps
    end

    add_index :verse_texts, [:verse_id, :version], unique: true
  end
end
