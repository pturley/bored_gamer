class CreateJoinTableGameHonor < ActiveRecord::Migration[5.1]
  def change
    create_join_table :games, :honors do |t|
      t.index [:game_id, :honor_id], :unique => true
      t.index :honor_id
    end
  end
end
