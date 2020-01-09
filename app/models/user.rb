class User < ApplicationRecord
  validates :name, {:presence=>true}
  validates :email, presence: true
  has_many :events, class_name: 'Event', foreing_key: 'user_id'
  has_many :attendances
  has_many :attended_events, through: :attendances, source: 'event'

end
