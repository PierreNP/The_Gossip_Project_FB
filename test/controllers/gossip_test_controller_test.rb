require 'test_helper'

class GossipTestControllerTest < ActionDispatch::IntegrationTest
  test "should get deftest" do
    get gossip_test_deftest_url
    assert_response :success
  end

end
