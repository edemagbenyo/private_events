class Event < ApplicationRecord
  belongs_to :user
  has_many :attendances
  has_mane :attendees, though: :attendances, source: 'user'
end
