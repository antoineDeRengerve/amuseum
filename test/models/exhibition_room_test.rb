# Nota: this test seems quite redundant given the tests in the exhibition_test.rb
# One can assume that the behavior of the exhibition model will rely on this join model
# and that the tests in the exhibition_test.rb are sufficient to test the behavior of the join model

require "test_helper"

class ExhibitionRoomTest < ActiveSupport::TestCase
  setup do
    @exhibition_room = exhibition_rooms(:one)
  end

  test "belongs to exhibition" do
    assert_respond_to @exhibition_room, :exhibition
  end

  test "belongs to room" do
    assert_respond_to @exhibition_room, :room
  end

  test "has order" do
    assert_respond_to @exhibition_room, :order
  end
end
