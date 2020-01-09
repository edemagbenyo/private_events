class User < ApplicationRecord
  has_many :events
  has_many :attendances
  has_many :attended_events, through: :attendances, class_name: 'Events'
  validates :name, presence: true
  validates :email, presence: true

  def upcoming_events
    future_events = []
    attendances.each do |event|
      a = Event.find_by(id: event.event_id)
      future_events << a if a.event_date > DateTime.now
    end
    future_events
  end

  def previous_events
    past_events = []
    attendances.each do |event|
      a = Event.find_by(id: event.event_id)
      past_events << a if a.event_date < DateTime.now
    end
    past_events
    # attendances.where("event_date < DateTime.now")
  end

end
