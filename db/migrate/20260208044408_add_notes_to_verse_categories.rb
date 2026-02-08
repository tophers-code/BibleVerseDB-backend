class AddNotesToVerseCategories < ActiveRecord::Migration[8.0]
  def change
    add_column :verse_categories, :notes, :text
  end
end
