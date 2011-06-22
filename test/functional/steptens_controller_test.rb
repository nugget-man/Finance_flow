require 'test_helper'

class SteptensControllerTest < ActionController::TestCase
  setup do
    @stepten = steptens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:steptens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stepten" do
    assert_difference('Stepten.count') do
      post :create, :stepten => @stepten.attributes
    end

    assert_redirected_to stepten_path(assigns(:stepten))
  end

  test "should show stepten" do
    get :show, :id => @stepten.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @stepten.to_param
    assert_response :success
  end

  test "should update stepten" do
    put :update, :id => @stepten.to_param, :stepten => @stepten.attributes
    assert_redirected_to stepten_path(assigns(:stepten))
  end

  test "should destroy stepten" do
    assert_difference('Stepten.count', -1) do
      delete :destroy, :id => @stepten.to_param
    end

    assert_redirected_to steptens_path
  end
end
