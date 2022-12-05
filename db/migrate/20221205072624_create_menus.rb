class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.string :name
      t.integer :price
      t.text :note
      t.string :photo
      t.datetime :delete_at
      t.integer :quantity

      t.timestamps
    end
    add_index :menus, :delete_at
  end
end
