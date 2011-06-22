require 'test_helper'

class StepfoursControllerTest < ActionController::TestCase
  setup do
    @stepfour = stepfours(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stepfours)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stepfour" do
    assert_difference('Stepfour.count') do
      post :create, :stepfour => @stepfour.attributes
    end

    assert_redirected_to stepfour_path(assigns(:stepfour))
  end

  test "should show stepfour" do
    get :show, :id => @stepfour.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @stepfour.to_param
    assert_response :success
  end

  test "should update stepfour" do
    put :update, :id => @stepfour.to_param, :stepfour => @stepfour.attributes
    assert_redirected_to stepfour_path(assigns(:stepfour))
  end

  test "should destroy stepfour" do
    assert_difference('Stepfour.count', -1) do
      delete :destroy, :id => @stepfour.to_param
    end

    assert_redirected_to stepfours_path
  end
end
