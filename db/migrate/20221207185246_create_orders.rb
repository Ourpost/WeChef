class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.integer :price
      t.text :note
      t.string :photo
      t.datetime :delete_at
      t.integer :quantity

      t.timestamps
      add_index :orders, :delete_at
    end
  end
end
