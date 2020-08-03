class CreateMyCalendarUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :my_calendar_users do |t|
      t.references :my_calendar, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
