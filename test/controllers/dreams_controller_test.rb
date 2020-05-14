require 'test_helper'

class DreamsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get dreams_home_url
    assert_response :success
  end

end
