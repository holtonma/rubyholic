require 'test_helper'

class LocationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create location" do
    # assert_difference('Location.count') do
    #   post :create, :location => { }
    # end
    # 
    # assert_redirected_to location_path(assigns(:location))
  end

  test "should show location" do
    get :show, :id => locations(:seattle).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => locations(:glenview).id
    assert_response :success
  end

  test "should update location" do
    put :update, :id => locations(:seattle).id, :location => { }
    assert_redirected_to location_path(assigns(:location))
  end

  test "should destroy location" do
    assert_difference('Location.count', -1) do
      delete :destroy, :id => locations(:seattle).id
    end

    assert_redirected_to locations_path
  end
end
