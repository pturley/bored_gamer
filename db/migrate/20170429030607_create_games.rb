class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :name
      t.string :description
      t.integer :bgg_id
      t.integer :yearpublished
      t.integer :minplayers
      t.integer :maxplayers
      t.integer :playingtime
      t.integer :minplaytime
      t.integer :maxplaytime
      t.integer :age
      t.string :thumbnail
      t.string :image

      t.timestamps
    end
  end
end
