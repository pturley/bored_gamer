class CreateJoinTableGameSubdomain < ActiveRecord::Migration[5.1]
  def change
    create_join_table :games, :subdomains do |t|
      t.index [:game_id, :subdomain_id], :unique => true
      t.index :subdomain_id
    end
  end
end
