class ReplaceDeleteAtByDeletedAtToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :deleted_at, :datetime
    add_index :orders, :deleted_at
    remove_index :orders, :delete_at
    remove_column :orders, :delete_at, :datetime
  end
end
