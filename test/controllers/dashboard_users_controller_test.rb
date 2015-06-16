require 'test_helper'

class DashboardUsersControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  setup do 
    sign_in DashboardUser.first
  end

  test "it should show the user's profile page" do
    get :show, {
      :id => 1
    }

    assert_response :success
  end
end
