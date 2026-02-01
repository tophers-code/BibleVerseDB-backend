class CreateVerses < ActiveRecord::Migration[8.0]
  def change
    create_table :verses do |t|
      t.references :bible_book, null: false, foreign_key: true
      t.integer :chapter, null: false
      t.integer :verse_start, null: false
      t.integer :verse_end
      t.text :notes

      t.timestamps
    end
    add_index :verses, [:bible_book_id, :chapter, :verse_start, :verse_end], unique: true, name: 'index_verses_on_book_chapter_verse'
  end
end
