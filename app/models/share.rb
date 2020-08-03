class Share < ApplicationRecord
  has_many :share_users
  has_many :users, through: :share_users
  has_many :events

  validates :name, presence: true, uniqueness: true
end
