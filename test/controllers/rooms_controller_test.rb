require "test_helper"

class RoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @room = rooms(:one)
  end

  test "should show room if any" do
    get room_path(@room)
    assert_response :success
    assert_select ".room__title", text: @room.name
  end
end
