require 'test_helper'

class SteptwosControllerTest < ActionController::TestCase
  setup do
    @steptwo = steptwos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:steptwos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create steptwo" do
    assert_difference('Steptwo.count') do
      post :create, :steptwo => @steptwo.attributes
    end

    assert_redirected_to steptwo_path(assigns(:steptwo))
  end

  test "should show steptwo" do
    get :show, :id => @steptwo.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @steptwo.to_param
    assert_response :success
  end

  test "should update steptwo" do
    put :update, :id => @steptwo.to_param, :steptwo => @steptwo.attributes
    assert_redirected_to steptwo_path(assigns(:steptwo))
  end

  test "should destroy steptwo" do
    assert_difference('Steptwo.count', -1) do
      delete :destroy, :id => @steptwo.to_param
    end

    assert_redirected_to steptwos_path
  end
end
