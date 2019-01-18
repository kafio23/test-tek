class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email
      t.string :password_digest
      t.string :role, null: false, default: 'user'
      t.datetime :last_login

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
