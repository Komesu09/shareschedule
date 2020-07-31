class ChangeCalendarsToMyCalendars < ActiveRecord::Migration[5.2]

  def change
    rename_table :calendars, :my_calendars
  end
end
