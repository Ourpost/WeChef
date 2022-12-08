class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :order_number
      t.string :create_tiime
      t.integer :quantity
      t.integer :total_price
      t.text :note
      t.string :delete_at
      t.boolean :utensils

      t.timestamps
    end
  end
end
