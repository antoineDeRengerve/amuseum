require "test_helper"

class ExhibitionTest < ActiveSupport::TestCase
  setup do
    @exhibition = exhibitions(:one)
  end

  test "exhibition has dates" do
    assert_respond_to @exhibition, :start_date
    assert_respond_to @exhibition, :end_date
  end

  test "exhibition has many rooms" do
    assert_respond_to @exhibition, :rooms
  end

  test "exhibition has many exhibition_rooms" do
    assert_respond_to @exhibition, :exhibition_rooms
  end

  test "requires start_date and end_date" do
    exhibition = Exhibition.new
    assert_not exhibition.valid?
    assert_includes exhibition.errors[:start_date], "can't be blank"
    assert_includes exhibition.errors[:end_date], "can't be blank"
  end

  test ".current returns exhibition spanning current date" do
    travel_to Date.new(2025, 3, 12) do
      current = Exhibition.current
      assert_equal exhibitions(:one), current
      assert current.start_date <= Date.today
      assert current.end_date >= Date.today
    end
  end

  test ".add_next creates exhibition after last one" do
    travel_to Date.new(2025, 3, 25) do
      last_exhibition = exhibitions(:two)
      new_exhibition = Exhibition.add_next

      assert_equal last_exhibition.end_date + 1.day, new_exhibition.start_date
      assert_equal new_exhibition.start_date.sunday, new_exhibition.end_date
    end
  end

  test ".add_next creates exhibition from today if no future exhibitions" do
    travel_to Date.new(2026, 1, 1) do
      new_exhibition = Exhibition.add_next

      assert_equal Date.today, new_exhibition.start_date
      assert_equal Date.today.sunday, new_exhibition.end_date
    end
  end

  test ".add_next assigns random rooms within limits" do
    exhibition = Exhibition.add_next

    assert_operator exhibition.rooms.count, :>=, Exhibition::DEFAULT_ROOMS_COUNT_MIN
    assert_operator exhibition.rooms.count, :<=, Exhibition::DEFAULT_ROOMS_COUNT_MAX
  end

  test "assign_random_rooms creates ordered exhibition_rooms" do
    @exhibition.assign_random_rooms

    previous_order = -1
    @exhibition.exhibition_rooms.each do |exhibition_room|
      assert_operator exhibition_room.order, :>, previous_order
      previous_order = exhibition_room.order
    end
  end

  test "assign_random_rooms clears previous rooms" do
    original_rooms = @exhibition.rooms.to_a
    @exhibition.assign_random_rooms

    assert_not_equal original_rooms, @exhibition.rooms.to_a
  end
end
