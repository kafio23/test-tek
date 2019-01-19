class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.text :description
      t.string :category
      t.string :address
      t.boolean :status
      t.datetime :delivery_date
      t.datetime :reception_date
      t.integer :user_id
      t.string :image

      t.timestamps
    end
  end
end
