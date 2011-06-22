require 'test_helper'

class StepninesControllerTest < ActionController::TestCase
  setup do
    @stepnine = stepnines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stepnines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stepnine" do
    assert_difference('Stepnine.count') do
      post :create, :stepnine => @stepnine.attributes
    end

    assert_redirected_to stepnine_path(assigns(:stepnine))
  end

  test "should show stepnine" do
    get :show, :id => @stepnine.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @stepnine.to_param
    assert_response :success
  end

  test "should update stepnine" do
    put :update, :id => @stepnine.to_param, :stepnine => @stepnine.attributes
    assert_redirected_to stepnine_path(assigns(:stepnine))
  end

  test "should destroy stepnine" do
    assert_difference('Stepnine.count', -1) do
      delete :destroy, :id => @stepnine.to_param
    end

    assert_redirected_to stepnines_path
  end
end
