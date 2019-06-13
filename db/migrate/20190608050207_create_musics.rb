class CreateMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :musics do |t|
      t.integer :disc_id
      t.integer :artist_id
      t.string :title
      t.integer :track_number

      t.timestamps
    end
  end
end
