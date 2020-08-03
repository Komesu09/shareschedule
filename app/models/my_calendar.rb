class MyCalendar < ApplicationRecord
  has_many :my_calendar_users
  has_many :users, through: :my_calendar_users
  has_many :events
  
  validates :name, presence: true, uniqueness: true
end
