class MyCalendar < ApplicationRecord
  has_many :calendar_users
  has_many :users, through: :calendar_users
  validates :name, presence: true, uniqueness: true
end
