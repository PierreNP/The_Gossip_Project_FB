require 'test_helper'

class ShowOnePotinControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get show_one_potin_show_url
    assert_response :success
  end

end
