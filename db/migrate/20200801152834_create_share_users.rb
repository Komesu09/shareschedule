class CreateShareUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :share_users do |t|
      t.references :share, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
