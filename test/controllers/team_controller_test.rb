require 'test_helper'

class TeamControllerTest < ActionDispatch::IntegrationTest
  test "should get to_page" do
    get team_to_page_url
    assert_response :success
  end

end
