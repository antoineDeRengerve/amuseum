class Visit < ApplicationRecord
  belongs_to :current_room, class_name: "Room", optional: true
  belongs_to :visitor
  belongs_to :exhibition

  after_create :setup_visit, :end_previous_visits

  def end_visit
    update(ended_at: Time.current, last_activity_at: Time.current, current_room: nil)
  end

  def go_to_room(room)
    update(current_room: room, last_activity_at: Time.current)
  end

  private

  def setup_visit
    update(started_at: Time.current, last_activity_at: Time.current, current_room: Room.first_room)
  end

  # End all previous visits for the same visitor upon creating a new visit
  def end_previous_visits
    Visit.where(visitor: visitor).where.not(id: id, ended_at: nil).each { it.end_visit }
  end
end
