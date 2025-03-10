require "test_helper"

class VisitsControllerTest < ActionDispatch::IntegrationTest
  test "creating a visit redirects to first room" do
    assert_difference "Visit.count" do
      post visits_path
    end

    assert_redirected_to room_path(Room.first_room)
  end

  test "creating a visit sets visitor cookie" do
    post visits_path
    assert cookies.signed[:visitor_id].present?
  end

  test "creating a visit with existing visitor reuses visitor" do
    # Create initial visitor and visit
    post visits_path
    visitor_id = cookies.signed[:visitor_id]

    # Create another visit
    assert_difference "Visit.count" do
      post visits_path
    end

    # Should use same visitor
    assert_equal visitor_id, cookies.signed[:visitor_id]
  end
end
