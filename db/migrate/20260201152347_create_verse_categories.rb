class CreateVerseCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :verse_categories do |t|
      t.references :verse, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
    add_index :verse_categories, [:verse_id, :category_id], unique: true
  end
end
