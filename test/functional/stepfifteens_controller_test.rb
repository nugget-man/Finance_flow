require 'test_helper'

class StepfifteensControllerTest < ActionController::TestCase
  setup do
    @stepfifteen = stepfifteens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stepfifteens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stepfifteen" do
    assert_difference('Stepfifteen.count') do
      post :create, :stepfifteen => @stepfifteen.attributes
    end

    assert_redirected_to stepfifteen_path(assigns(:stepfifteen))
  end

  test "should show stepfifteen" do
    get :show, :id => @stepfifteen.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @stepfifteen.to_param
    assert_response :success
  end

  test "should update stepfifteen" do
    put :update, :id => @stepfifteen.to_param, :stepfifteen => @stepfifteen.attributes
    assert_redirected_to stepfifteen_path(assigns(:stepfifteen))
  end

  test "should destroy stepfifteen" do
    assert_difference('Stepfifteen.count', -1) do
      delete :destroy, :id => @stepfifteen.to_param
    end

    assert_redirected_to stepfifteens_path
  end
end
