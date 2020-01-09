class User < ApplicationRecord
  has_many :events
  has_many :attendances
  has_many :attended_events, through: :attendances
  validates :name, presence: true
  validates :email, presence: true

end
