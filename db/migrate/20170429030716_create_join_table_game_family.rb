class CreateJoinTableGameFamily < ActiveRecord::Migration[5.1]
  def change
    create_join_table :games, :families do |t|
      t.index [:game_id, :family_id], :unique => true
      t.index :family_id
    end
  end
end
