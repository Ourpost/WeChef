class AddColumnTimeToStore < ActiveRecord::Migration[6.1]
  def change
    add_column :stores, :time_start, :time
    add_column :stores, :time_end, :time
  end
end
