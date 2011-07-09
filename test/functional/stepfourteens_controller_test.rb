require 'test_helper'

class StepfourteensControllerTest < ActionController::TestCase
  setup do
    @stepfourteen = stepfourteens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stepfourteens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stepfourteen" do
    assert_difference('Stepfourteen.count') do
      post :create, :stepfourteen => @stepfourteen.attributes
    end

    assert_redirected_to stepfourteen_path(assigns(:stepfourteen))
  end

  test "should show stepfourteen" do
    get :show, :id => @stepfourteen.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @stepfourteen.to_param
    assert_response :success
  end

  test "should update stepfourteen" do
    put :update, :id => @stepfourteen.to_param, :stepfourteen => @stepfourteen.attributes
    assert_redirected_to stepfourteen_path(assigns(:stepfourteen))
  end

  test "should destroy stepfourteen" do
    assert_difference('Stepfourteen.count', -1) do
      delete :destroy, :id => @stepfourteen.to_param
    end

    assert_redirected_to stepfourteens_path
  end
end
