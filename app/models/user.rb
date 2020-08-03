class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :my_calendar_users
  has_many :share_users
  has_many :shares, through: :share_users
  has_many :my_calendars, through: :my_calendar_users
  has_many :events

  validates :name,presence: true
end
