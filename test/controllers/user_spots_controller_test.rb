require "test_helper"

class UserSpotsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_spots_index_url
    assert_response :success
  end
end
