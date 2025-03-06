require "application_system_test_case"

class VisitorsTest < ApplicationSystemTestCase
  test "does not display visitor ID when not present" do
    # Clear any existing cookies
    page.driver.browser.manage.delete_all_cookies

    visit root_path

    assert_no_selector ".navbar__visitor"
  end

  test "clicking Enter button creates new visitor and redirects to first room" do
    # Clear any existing cookies
    page.driver.browser.manage.delete_all_cookies

    visit root_path

    assert_selector "form.welcome__form"
    click_button "Enter"

    # Wait for redirect and verify we're on the first room page
    assert_selector ".room__title", text: Room.first_room.name

    # Verify the path
    assert_equal room_path(Room.first_room), current_path

    # Should have visitor cookie set
    visitor_cookie = page.driver.browser.manage.cookie_named("visitor_id")
    assert visitor_cookie.present?

    # Visitor id should be displayed in the navbar
    assert_selector ".navbar__visitor", text: Visitor.last.id
  end
end
