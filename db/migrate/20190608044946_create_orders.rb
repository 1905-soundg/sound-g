class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :subtotal_price
      t.integer :fee
      t.string :postalcode
      t.string :address
      t.string :last_name
      t.string :first_name
      t.integer :order_status

      t.timestamps
    end
  end
end
