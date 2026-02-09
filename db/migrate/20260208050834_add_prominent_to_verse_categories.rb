class AddProminentToVerseCategories < ActiveRecord::Migration[8.0]
  def change
    add_column :verse_categories, :prominent, :boolean, default: false, null: false
  end
end
