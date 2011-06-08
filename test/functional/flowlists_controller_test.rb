require 'test_helper'

class FlowlistsControllerTest < ActionController::TestCase
  setup do
    @flowlist = flowlists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flowlists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flowlist" do
    assert_difference('Flowlist.count') do
      post :create, :flowlist => @flowlist.attributes
    end

    assert_redirected_to flowlist_path(assigns(:flowlist))
  end

  test "should show flowlist" do
    get :show, :id => @flowlist.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @flowlist.to_param
    assert_response :success
  end

  test "should update flowlist" do
    put :update, :id => @flowlist.to_param, :flowlist => @flowlist.attributes
    assert_redirected_to flowlist_path(assigns(:flowlist))
  end

  test "should destroy flowlist" do
    assert_difference('Flowlist.count', -1) do
      delete :destroy, :id => @flowlist.to_param
    end

    assert_redirected_to flowlists_path
  end
end
