require 'test_helper'

class StepthirteensControllerTest < ActionController::TestCase
  setup do
    @stepthirteen = stepthirteens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stepthirteens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stepthirteen" do
    assert_difference('Stepthirteen.count') do
      post :create, :stepthirteen => @stepthirteen.attributes
    end

    assert_redirected_to stepthirteen_path(assigns(:stepthirteen))
  end

  test "should show stepthirteen" do
    get :show, :id => @stepthirteen.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @stepthirteen.to_param
    assert_response :success
  end

  test "should update stepthirteen" do
    put :update, :id => @stepthirteen.to_param, :stepthirteen => @stepthirteen.attributes
    assert_redirected_to stepthirteen_path(assigns(:stepthirteen))
  end

  test "should destroy stepthirteen" do
    assert_difference('Stepthirteen.count', -1) do
      delete :destroy, :id => @stepthirteen.to_param
    end

    assert_redirected_to stepthirteens_path
  end
end
