class CreateJoinTableGameCategory < ActiveRecord::Migration[5.1]
  def change
    create_join_table :games, :categories do |t|
      t.index [:game_id, :category_id], :unique => true
      t.index :category_id
    end
  end
end
