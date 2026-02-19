class AddDefinitionToTagsAndProgressions < ActiveRecord::Migration[8.0]
  def change
    add_column :tags, :definition, :string
    add_column :verse_progressions, :definition, :string
  end
end
