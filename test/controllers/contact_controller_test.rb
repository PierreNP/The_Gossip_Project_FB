require 'test_helper'

class ContactControllerTest < ActionDispatch::IntegrationTest
  test "should get def1" do
    get contact_def1_url
    assert_response :success
  end

end
