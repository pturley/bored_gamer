class CreateJoinTableGamePublisher < ActiveRecord::Migration[5.1]
  def change
    create_join_table :games, :publishers do |t|
      t.index [:game_id, :publisher_id], :unique => true
      t.index :publisher_id
    end
  end
end
