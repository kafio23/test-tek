class AddFullNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :full_name, :string
    add_column :users, :role, :string, null: false, default: 'user'
  end
end
