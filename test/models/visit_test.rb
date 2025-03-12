require "test_helper"

class VisitTest < ActiveSupport::TestCase
  setup do
    @visitor = visitors(:one)
    @room = rooms(:one)
    @next_room = rooms(:two)
    @exhibition = exhibitions(:one)
  end

  test "visit can be created without current room" do
    visit = Visit.new(visitor: @visitor, exhibition: @exhibition)
    assert visit.valid?
  end

  test "visit belongs to a visitor" do
    visit = Visit.new(current_room: @room, exhibition: @exhibition)
    assert_not visit.valid?
    visit.visitor = @visitor
    assert visit.valid?
  end

  test "visit belongs to an exhibition" do
    visit = Visit.new(current_room: @room, visitor: @visitor)
    assert_not visit.valid?
    visit.exhibition = @exhibition
    assert visit.valid?
  end

  test "new visit is set up with first room and timestamps" do
    travel_to Time.current do
      visit = Visit.create!(visitor: @visitor, exhibition: @exhibition)

      assert_equal Room.first_room, visit.current_room
      assert_equal Time.current, visit.started_at
      assert_equal Time.current, visit.last_activity_at
      assert_nil visit.ended_at
    end
  end

  test "creating new visit ends previous visits for same visitor" do
    travel_to 1.hour.ago do
      # Create an active visit
      @first_visit = Visit.create!(visitor: @visitor, exhibition: @exhibition)
      assert_equal Time.current, @first_visit.started_at
      assert_nil @first_visit.ended_at
    end

    travel_to Time.current do
      # Create another visit for same visitor
      @second_visit = Visit.create!(visitor: @visitor, exhibition: @exhibition)

      # Reload first visit to get updated attributes
      @first_visit.reload

      assert_equal Time.current, @first_visit.ended_at
      assert_equal Time.current, @second_visit.started_at
      assert_nil @second_visit.ended_at
    end
  end

  test "ending a visit sets ended_at and clears current room" do
    travel_to 1.hour.ago do
      @visit = Visit.create!(visitor: @visitor, exhibition: @exhibition)
      assert_equal Time.current, @visit.last_activity_at
    end

    travel_to Time.current do
      @visit.end_visit

      assert_equal Time.current, @visit.ended_at
      assert_nil @visit.current_room
      assert_equal Time.current, @visit.last_activity_at
    end
  end

  test "going to a new room updates current room and last activity" do
    travel_to 1.hour.ago do
      @visit = Visit.create!(visitor: @visitor, exhibition: @exhibition)
      assert_equal Time.current, @visit.last_activity_at
    end

    travel_to Time.current do
      @visit.go_to_room(@next_room)

      assert_equal @next_room, @visit.current_room
      assert_equal Time.current, @visit.last_activity_at
    end
  end
end
