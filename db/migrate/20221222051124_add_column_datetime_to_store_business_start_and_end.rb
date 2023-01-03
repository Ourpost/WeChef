# frozen_string_literal: true

class AddColumnDatetimeToStoreBusinessStartAndEnd < ActiveRecord::Migration[6.1]
  def change
    add_column :stores, :business_start, :datetime
    add_column :stores, :business_end, :datetime
  end
end
