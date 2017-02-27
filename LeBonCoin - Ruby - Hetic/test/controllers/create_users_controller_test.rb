require 'test_helper'

class CreateUsersControllerTest < ActionController::TestCase
  setup do
    @create_user = create_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:create_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create create_user" do
    assert_difference('CreateUser.count') do
      post :create, create_user: {  }
    end

    assert_redirected_to create_user_path(assigns(:create_user))
  end

  test "should show create_user" do
    get :show, id: @create_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @create_user
    assert_response :success
  end

  test "should update create_user" do
    patch :update, id: @create_user, create_user: {  }
    assert_redirected_to create_user_path(assigns(:create_user))
  end

  test "should destroy create_user" do
    assert_difference('CreateUser.count', -1) do
      delete :destroy, id: @create_user
    end

    assert_redirected_to create_users_path
  end
end
