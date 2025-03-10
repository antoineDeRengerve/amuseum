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
end
