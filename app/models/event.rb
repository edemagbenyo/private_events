# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user
  has_many :attendances
  has_many :attendees, through: :attendances
  scope :past, -> { where('event_date < (?)', DateTime.now) }
  scope :future, -> { where('event_date > (?)', DateTime.now) }

  def attended_event?(user)
    attendees.include?(user)
  end
end
