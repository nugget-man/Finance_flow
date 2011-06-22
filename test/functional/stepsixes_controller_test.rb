require 'test_helper'

class StepsixesControllerTest < ActionController::TestCase
  setup do
    @stepsix = stepsixes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stepsixes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stepsix" do
    assert_difference('Stepsix.count') do
      post :create, :stepsix => @stepsix.attributes
    end

    assert_redirected_to stepsix_path(assigns(:stepsix))
  end

  test "should show stepsix" do
    get :show, :id => @stepsix.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @stepsix.to_param
    assert_response :success
  end

  test "should update stepsix" do
    put :update, :id => @stepsix.to_param, :stepsix => @stepsix.attributes
    assert_redirected_to stepsix_path(assigns(:stepsix))
  end

  test "should destroy stepsix" do
    assert_difference('Stepsix.count', -1) do
      delete :destroy, :id => @stepsix.to_param
    end

    assert_redirected_to stepsixes_path
  end
end
