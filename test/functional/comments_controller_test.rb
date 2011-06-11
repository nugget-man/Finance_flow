require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  test "should get get_post" do
    get :get_post
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
