# frozen_string_literal: true

class AddColumnToStoreId < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :store_id, :integer
  end
end
