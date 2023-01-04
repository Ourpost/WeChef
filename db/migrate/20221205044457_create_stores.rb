# frozen_string_literal: true

class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :tel
      t.string :address
      t.string :business_hours_start
      t.string :business_hours_end
      t.datetime :delete_at
      t.string :logo

      t.timestamps
    end
    add_index :stores, :delete_at
  end
end
