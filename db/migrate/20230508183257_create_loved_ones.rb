class CreateLovedOnes < ActiveRecord::Migration[6.0]
  def change
    create_table :loved_ones do |t|
      t.integer :user_id
      t.string :name
      t.string :relationship
      t.integer :occasions_count
      t.integer :gifts_count

      t.timestamps
    end
  end
end
