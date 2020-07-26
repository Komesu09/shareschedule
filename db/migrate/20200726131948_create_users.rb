class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name,null:false
      t.string :mail,null:false,unique: true
      t.string :password, null:false
      t.timestamps
    end
  end
end