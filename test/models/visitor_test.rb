require "test_helper"

class VisitorTest < ActiveSupport::TestCase
  setup do
    @visitor = visitors(:one)
  end

  test "associations" do
    assert_respond_to @visitor, :visits
    assert_respond_to @visitor, :current_visit
  end

  test "create_visit! creates a new visit" do
    assert_difference -> { @visitor.visits.count } do
      @visitor.create_visit!
    end
  end

  test "current_room returns the room from current visit" do
    visit = @visitor.create_visit!
    room = Room.new(name: "Test Room")
    visit.go_to_room(room)

    assert_equal room, @visitor.current_room
    assert_equal room, visit.reload.current_room
  end

  test "end_current_visit ends the current visit" do
    visit = @visitor.create_visit!
    @visitor.end_current_visit

    assert_not_nil visit.reload.ended_at
  end
end
