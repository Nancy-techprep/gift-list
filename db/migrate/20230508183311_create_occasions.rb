class CreateOccasions < ActiveRecord::Migration[6.0]
  def change
    create_table :occasions do |t|
      t.integer :user_id
      t.integer :loved_one_id
      t.string :name
      t.date :date
      t.integer :gifts_count

      t.timestamps
    end
  end
end
