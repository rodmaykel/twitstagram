require 'test_helper'

class InstaControllerTest < ActionController::TestCase
  setup do
    @instum = insta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:insta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create instum" do
    assert_difference('Instum.count') do
      post :create, instum: { caption: @instum.caption, created: @instum.created, photo: @instum.photo, subject_id: @instum.subject_id }
    end

    assert_redirected_to instum_path(assigns(:instum))
  end

  test "should show instum" do
    get :show, id: @instum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @instum
    assert_response :success
  end

  test "should update instum" do
    patch :update, id: @instum, instum: { caption: @instum.caption, created: @instum.created, photo: @instum.photo, subject_id: @instum.subject_id }
    assert_redirected_to instum_path(assigns(:instum))
  end

  test "should destroy instum" do
    assert_difference('Instum.count', -1) do
      delete :destroy, id: @instum
    end

    assert_redirected_to insta_path
  end
end
