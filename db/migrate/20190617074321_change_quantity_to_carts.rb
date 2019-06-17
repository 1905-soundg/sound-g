class ChangeQuantityToCarts < ActiveRecord::Migration[5.2]
  def up
    change_column :Carts, :quantity, :integer, null: false, default: 0
  end

  def down
    change_column :Carts, :quantity, :integer, null: true
  end
end
