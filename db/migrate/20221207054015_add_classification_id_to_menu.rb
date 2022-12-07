class AddClassificationIdToMenu < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :classification_id, :integer
  end
end
