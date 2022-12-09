class AddSerialNumberToDesks < ActiveRecord::Migration[6.1]
  def change
    add_column :desks, :serial_number, :string
  end
end
