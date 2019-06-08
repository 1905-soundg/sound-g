class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :label_id
      t.integer :genre_id
      t.string :album
      t.string :image_id
      t.integer :price
      t.integer :stock_quantity
      t.integer :sales_status

      t.timestamps
    end
  end
end
