class CalendarUser < ApplicationRecord
  belongs_to :calendar
  belongs_to :user
end
