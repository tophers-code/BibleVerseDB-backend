class CreatePortalUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :portal_users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :role, null: false, default: "user"
      t.timestamps
    end
    add_index :portal_users, :email, unique: true
  end
end
