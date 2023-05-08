class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.integer :loved_ones_count
      t.integer :occasions_count
      t.integer :gifts_count

      t.timestamps
    end
  end
end
