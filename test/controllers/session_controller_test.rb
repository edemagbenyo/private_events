require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test "should get signin" do
    get session_signin_url
    assert_response :success
  end

end
