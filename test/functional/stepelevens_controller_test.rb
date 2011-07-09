require 'test_helper'

class StepelevensControllerTest < ActionController::TestCase
  setup do
    @stepeleven = stepelevens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stepelevens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stepeleven" do
    assert_difference('Stepeleven.count') do
      post :create, :stepeleven => @stepeleven.attributes
    end

    assert_redirected_to stepeleven_path(assigns(:stepeleven))
  end

  test "should show stepeleven" do
    get :show, :id => @stepeleven.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @stepeleven.to_param
    assert_response :success
  end

  test "should update stepeleven" do
    put :update, :id => @stepeleven.to_param, :stepeleven => @stepeleven.attributes
    assert_redirected_to stepeleven_path(assigns(:stepeleven))
  end

  test "should destroy stepeleven" do
    assert_difference('Stepeleven.count', -1) do
      delete :destroy, :id => @stepeleven.to_param
    end

    assert_redirected_to stepelevens_path
  end
end
