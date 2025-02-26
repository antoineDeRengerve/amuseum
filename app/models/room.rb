class Room < ApplicationRecord
  belongs_to :prev_room, class_name: "Room", optional: true
  belongs_to :next_room, class_name: "Room", optional: true

  def set_next_room(room)
    self.next_room = room
    room.prev_room = self
    room.save!
    save!
  end
end
