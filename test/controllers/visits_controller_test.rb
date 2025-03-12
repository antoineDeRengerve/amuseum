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
    assert @response.cookies["visitor_id"].present?
  end

  test "creating a visit associated to visitor matching cookie" do
    # Set the signed cookie using the integration session
    # get root_path # Need to make an initial request to set cookies
    cookies = ActionDispatch::Request.new(Rails.application.env_config).cookie_jar
    visitor = visitors(:one)
    cookies.signed[:visitor_id] = visitor.id

    post visits_path

    # Should use same visitor
    assert_equal visitor.id, Visit.last.visitor.id
  end
end
