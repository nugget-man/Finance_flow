require 'test_helper'

class SteptwelvesControllerTest < ActionController::TestCase
  setup do
    @steptwelf = steptwelves(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:steptwelves)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create steptwelf" do
    assert_difference('Steptwelve.count') do
      post :create, :steptwelf => @steptwelf.attributes
    end

    assert_redirected_to steptwelf_path(assigns(:steptwelf))
  end

  test "should show steptwelf" do
    get :show, :id => @steptwelf.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @steptwelf.to_param
    assert_response :success
  end

  test "should update steptwelf" do
    put :update, :id => @steptwelf.to_param, :steptwelf => @steptwelf.attributes
    assert_redirected_to steptwelf_path(assigns(:steptwelf))
  end

  test "should destroy steptwelf" do
    assert_difference('Steptwelve.count', -1) do
      delete :destroy, :id => @steptwelf.to_param
    end

    assert_redirected_to steptwelves_path
  end
end
