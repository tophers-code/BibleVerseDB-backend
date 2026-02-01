class CreateBibleBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :bible_books do |t|
      t.string :name, null: false
      t.string :abbreviation, null: false
      t.integer :testament, null: false
      t.integer :book_order, null: false
      t.integer :chapter_count, null: false

      t.timestamps
    end
    add_index :bible_books, :name, unique: true
    add_index :bible_books, :book_order, unique: true
  end
end
