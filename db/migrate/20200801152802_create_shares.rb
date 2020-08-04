class CreateShares < ActiveRecord::Migration[5.2]
  def change
    create_table :shares do |t|
      t.string :name 
      t.index :name, unique: true
      t.timestamps
    end
  end
end
