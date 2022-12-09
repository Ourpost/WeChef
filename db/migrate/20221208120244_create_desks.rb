class CreateDesks < ActiveRecord::Migration[6.1]
  def change
    create_table :desks do |t|
      t.string :name
      t.integer :seat_amount
      t.belongs_to :store, null: false, foreign_key: true
      t.datetime :delete_at

      t.timestamps
    end
    add_index :desks, :delete_at
  end
end
