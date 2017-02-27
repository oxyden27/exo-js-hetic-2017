require 'test_helper'

class CreateAnnoncesControllerTest < ActionController::TestCase
  setup do
    @create_annonce = create_annonces(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:create_annonces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create create_annonce" do
    assert_difference('CreateAnnonce.count') do
      post :create, create_annonce: {  }
    end

    assert_redirected_to create_annonce_path(assigns(:create_annonce))
  end

  test "should show create_annonce" do
    get :show, id: @create_annonce
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @create_annonce
    assert_response :success
  end

  test "should update create_annonce" do
    patch :update, id: @create_annonce, create_annonce: {  }
    assert_redirected_to create_annonce_path(assigns(:create_annonce))
  end

  test "should destroy create_annonce" do
    assert_difference('CreateAnnonce.count', -1) do
      delete :destroy, id: @create_annonce
    end

    assert_redirected_to create_annonces_path
  end
end
