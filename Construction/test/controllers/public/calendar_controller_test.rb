require 'test_helper'

class Public::CalendarControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_calendar_index_url
    assert_response :success
  end

end
