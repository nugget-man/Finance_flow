require 'test_helper'

class RemoteControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get back" do
    get :back
    assert_response :success
  end

  test "should get forward" do
    get :forward
    assert_response :success
  end

  test "should get home" do
    get :home
    assert_response :success
  end

end
