class CreateProgressionSteps < ActiveRecord::Migration[8.0]
  def change
    create_table :progression_steps do |t|
      t.references :verse_progression, null: false, foreign_key: true
      t.references :verse, null: false, foreign_key: true
      t.integer :step_order, null: false

      t.timestamps
    end
    add_index :progression_steps, [:verse_progression_id, :step_order], unique: true
  end
end
