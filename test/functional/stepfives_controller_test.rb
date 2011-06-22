require 'test_helper'

class StepfivesControllerTest < ActionController::TestCase
  setup do
    @stepfife = stepfives(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stepfives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stepfife" do
    assert_difference('Stepfive.count') do
      post :create, :stepfife => @stepfife.attributes
    end

    assert_redirected_to stepfife_path(assigns(:stepfife))
  end

  test "should show stepfife" do
    get :show, :id => @stepfife.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @stepfife.to_param
    assert_response :success
  end

  test "should update stepfife" do
    put :update, :id => @stepfife.to_param, :stepfife => @stepfife.attributes
    assert_redirected_to stepfife_path(assigns(:stepfife))
  end

  test "should destroy stepfife" do
    assert_difference('Stepfive.count', -1) do
      delete :destroy, :id => @stepfife.to_param
    end

    assert_redirected_to stepfives_path
  end
end
