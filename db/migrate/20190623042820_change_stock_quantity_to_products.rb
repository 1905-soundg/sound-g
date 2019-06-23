class ChangeStockQuantityToProducts < ActiveRecord::Migration[5.2]

  def up
  	change_column :products, :stock_quantity, :integer, null: false, default: 0
  end

  def down
  	change_column :products, :stock_quantity, :integer, null: true
  end

end
