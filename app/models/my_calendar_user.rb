class MyCalendarUser < ApplicationRecord
  belongs_to :my_calendar
  belongs_to :user
end
