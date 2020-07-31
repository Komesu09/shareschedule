class CreateCalendarUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :calendar_users do |t|
      t.references :calendar, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end