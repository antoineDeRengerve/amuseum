class Visitor < ApplicationRecord
  has_many :visits, dependent: :destroy
  has_one :current_visit, -> { where(ended_at: nil) }, class_name: "Visit"

  before_create :set_uuid

  def current_room
    current_visit.current_room
  end

  def end_current_visit
    current_visit.end_visit
  end

  def go_to_room(room)
    current_visit.go_to_room(room)
  end

  def create_visit
    Visit.create(visitor: self)
  end

  private

  def set_uuid
    self.id = SecureRandom.uuid if id.blank?
  end
end
