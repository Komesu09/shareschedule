class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :body
      t.datetime :start_date
      t.datetime :end_date
      t.references :calendar, foreign_key: true
      t.references :user, foreign_key:true
      t.timestamps
    end
  end
end
