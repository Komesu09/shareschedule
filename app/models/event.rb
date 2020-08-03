class Event < ApplicationRecord
  belongs_to :my_calendar
  belongs_to :share
  belongs_to :user
end
