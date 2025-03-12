class Visitor < ApplicationRecord
  has_many :visits, dependent: :destroy
  has_one :current_visit, -> { where(ended_at: nil) }, class_name: "Visit"

  def current_room
    current_visit.current_room
  end

  def end_current_visit
    current_visit.end_visit
  end

  def go_to_room(room)
    current_visit.go_to_room(room)
  end

  # Creates a new visit for the visitor
  # If no exhibition is provided, the current exhibition is used
  def create_visit!(exhibition: Exhibition.current)
    visits.create!(exhibition: exhibition)
  end
end
