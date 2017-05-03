class CreateCreators < ActiveRecord::Migration[5.1]
  def change
    create_table :creators do |t|
      t.string :name
      t.integer :bgg_id

      t.timestamps
    end
  end
end
