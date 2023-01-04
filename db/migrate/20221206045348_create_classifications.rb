# frozen_string_literal: true

class CreateClassifications < ActiveRecord::Migration[6.1]
  def change
    create_table :classifications do |t|
      t.string :name
      t.belongs_to :store, null: false, foreign_key: true
      t.datetime :delete_at

      t.timestamps
    end
    add_index :classifications, :delete_at
  end
end
