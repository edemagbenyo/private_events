class User < ApplicationRecord
  has_many :events
  has_many :attendances
  has_many :attended_events, through: :attendances, class_name: 'Events'
  validates :name, presence: true
  validates :email, presence: true

  def upcoming_events
    events.each do |event|
      a = Event.find_by(id: event.id)
      return a if a.event_date < DateTime.now
    end
  end

  def previous_events
    attended_events.each do |event|
      a = Event.find_by(id: event.id)
      return a if a.event_date > DateTime.now
    end
  end

end
