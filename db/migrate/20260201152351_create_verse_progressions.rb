class CreateVerseProgressions < ActiveRecord::Migration[8.0]
  def change
    create_table :verse_progressions do |t|
      t.string :name, null: false
      t.text :description

      t.timestamps
    end
    add_index :verse_progressions, :name, unique: true
  end
end
