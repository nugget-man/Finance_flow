require 'test_helper'

class StepsevensControllerTest < ActionController::TestCase
  setup do
    @stepseven = stepsevens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stepsevens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stepseven" do
    assert_difference('Stepseven.count') do
      post :create, :stepseven => @stepseven.attributes
    end

    assert_redirected_to stepseven_path(assigns(:stepseven))
  end

  test "should show stepseven" do
    get :show, :id => @stepseven.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @stepseven.to_param
    assert_response :success
  end

  test "should update stepseven" do
    put :update, :id => @stepseven.to_param, :stepseven => @stepseven.attributes
    assert_redirected_to stepseven_path(assigns(:stepseven))
  end

  test "should destroy stepseven" do
    assert_difference('Stepseven.count', -1) do
      delete :destroy, :id => @stepseven.to_param
    end

    assert_redirected_to stepsevens_path
  end
end
