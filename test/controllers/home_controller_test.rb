require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home_def" do
    get home_home_def_url
    assert_response :success
  end

end
