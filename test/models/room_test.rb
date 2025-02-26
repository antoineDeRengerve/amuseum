require "test_helper"

class RoomTest < ActiveSupport::TestCase
  test "room has a name" do
    room = rooms(:one)
    assert_equal "Room 1", room.name
  end

  test "room has a background image" do
    room = rooms(:one)
    assert_equal "/rooms/room-1.jpg", room.room_background_url
  end

  test "room has a previous room" do
    room = rooms(:two)
    assert_equal rooms(:one), room.prev_room
  end

  test "room has a next room" do
    room = rooms(:two)
    assert_equal rooms(:three), room.next_room
  end

  test "room has no previous room" do
    room = rooms(:one)
    assert_nil room.prev_room
  end

  test "room has no next room" do
    room = rooms(:three)
    assert_nil room.next_room
  end

  test "room can set next room" do
    room = rooms(:one)
    room.set_next_room(rooms(:two))
    assert_equal rooms(:two), room.next_room
  end
end
