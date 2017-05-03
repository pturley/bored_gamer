class CreateJoinTableGameMechanic < ActiveRecord::Migration[5.1]
  def change
    create_join_table :games, :mechanics do |t|
      t.index [:game_id, :mechanic_id], :unique => true
      t.index :mechanic_id
    end
  end
end
