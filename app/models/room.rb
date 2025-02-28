class Room < ApplicationRecord
  belongs_to :prev_room, class_name: "Room", optional: true
  belongs_to :next_room, class_name: "Room", optional: true

  before_destroy :update_room_connections

  def self.first_room
    Room.find_by(is_first_room: true)
  end

  def set_next_room(room)
    self.next_room = room
    room.prev_room = self
    room.save!
    save!
  end

  private

  def update_room_connections
    if prev_room && next_room
      prev_room.next_room = next_room
      next_room.prev_room = prev_room
      prev_room.save!
      next_room.save!
    elsif prev_room
      prev_room.next_room = nil
      prev_room.save!
    elsif next_room
      next_room.prev_room = nil
      next_room.save!
    end
  end
end
