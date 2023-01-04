# frozen_string_literal: true

class AddAasmStateToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :aasm_state, :string
  end
end
