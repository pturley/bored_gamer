class CreateJoinTableGameDesigner < ActiveRecord::Migration[5.1]
  def change
    create_table :designers_games do |t|
      t.references :game
      t.references :creator
      t.index [:game_id, :creator_id], :unique => true
    end
  end
end
