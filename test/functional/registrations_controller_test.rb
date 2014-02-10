require 'test_helper'

class RegistrationsControllerTest < ActionController::TestCase
  test "should get registrations" do
    get :registrations
    assert_response :success
  end

end
