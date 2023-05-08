class CreateGifts < ActiveRecord::Migration[6.0]
  def change
    create_table :gifts do |t|
      t.integer :occasion_id
      t.integer :user_id
      t.text :note
      t.integer :loved_one_id

      t.timestamps
    end
  end
end
