class AddUserAndDeskToOrders < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :desk, null: false, foreign_key: true
    add_reference :orders, :user, null: false, foreign_key: true
  end
end
