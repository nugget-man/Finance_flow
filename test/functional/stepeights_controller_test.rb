require 'test_helper'

class StepeightsControllerTest < ActionController::TestCase
  setup do
    @stepeight = stepeights(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stepeights)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stepeight" do
    assert_difference('Stepeight.count') do
      post :create, :stepeight => @stepeight.attributes
    end

    assert_redirected_to stepeight_path(assigns(:stepeight))
  end

  test "should show stepeight" do
    get :show, :id => @stepeight.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @stepeight.to_param
    assert_response :success
  end

  test "should update stepeight" do
    put :update, :id => @stepeight.to_param, :stepeight => @stepeight.attributes
    assert_redirected_to stepeight_path(assigns(:stepeight))
  end

  test "should destroy stepeight" do
    assert_difference('Stepeight.count', -1) do
      delete :destroy, :id => @stepeight.to_param
    end

    assert_redirected_to stepeights_path
  end
end
