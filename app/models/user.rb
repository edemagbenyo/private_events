class User < ApplicationRecord
  has_many :events
  has_many :attendances
  has_many :attended_events, through: :attendances
  validates :name, presence: true
  validates :email, presence: true

  def upcoming_events
    events = current_user.attendances
    events.each do |event|
      a = Event.find_by(id: event.event_id)
      return a if a.event_date <= DateTime.now
    end
  end

end
