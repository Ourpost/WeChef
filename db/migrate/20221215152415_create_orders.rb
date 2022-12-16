class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :serial
      t.decimal :amount
      t.string :email
      t.jsonb :items, null: false, default: []
      t.datetime :pay_at
      t.datetime :delete_at

      t.timestamps
    end
    add_index :orders, :delete_at
  end
end
