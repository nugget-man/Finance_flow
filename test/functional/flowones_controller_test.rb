require 'test_helper'

class FlowonesControllerTest < ActionController::TestCase
  setup do
    @flowone = flowones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flowones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flowone" do
    assert_difference('Flowone.count') do
      post :create, :flowone => @flowone.attributes
    end

    assert_redirected_to flowone_path(assigns(:flowone))
  end

  test "should show flowone" do
    get :show, :id => @flowone.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @flowone.to_param
    assert_response :success
  end

  test "should update flowone" do
    put :update, :id => @flowone.to_param, :flowone => @flowone.attributes
    assert_redirected_to flowone_path(assigns(:flowone))
  end

  test "should destroy flowone" do
    assert_difference('Flowone.count', -1) do
      delete :destroy, :id => @flowone.to_param
    end

    assert_redirected_to flowones_path
  end
end
