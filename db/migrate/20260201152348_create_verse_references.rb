class CreateVerseReferences < ActiveRecord::Migration[8.0]
  def change
    create_table :verse_references do |t|
      t.references :verse, null: false, foreign_key: true
      t.references :referenced_verse, null: false, foreign_key: { to_table: :verses }

      t.timestamps
    end
    add_index :verse_references, [:verse_id, :referenced_verse_id], unique: true
  end
end
