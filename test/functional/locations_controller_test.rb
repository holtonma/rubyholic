require 'test_helper'
require 'flexmock/test_unit'

class LocationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:locations)
    assert_template "index"
    
    assert_tag :tag => 'h1', :content => "Rubyholic"
    assert_tag :tag => 'h2', :content => "Listing locations"
    assert_tag :tag => 'table'
    assert_select "table" do 
      assert_select "th", :count => 6 #6 column table
    end
    
    assert_tag :tag => 'a', :content => "Create new location"
    
    assert_equal 2, assigns(:locations).length
    
    assert_tag :tag => 'label', :content => "Address to search: " 
    assert_tag :tag => 'h3', :content => "Search for meetup location nearby you:" 
    assert_select "input#q", :count => 1
    assert_select "input", :count => 2
    assert_select "div.events_at", :count => 2
  end

  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should not create location when address is bad, because it won't geocode it" do
    num_locations = Location.count
    
    location = { 
      :name => 'bogus',
      :address => 'aassff asdf qwer lsdkjfaslkdjfasldfj',
      :notes => "this is a bogus address"
    }
    
    loc = Location.new(location)
    assert ! loc.save
    assert_equal num_locations, Location.count #grab the count after 
  end
  
  
  test "should create location" do
    num_locations = Location.count
    
    assert_difference('Location.count') do
      post :create, :location => { 
        :name => 'Bellagio',
        :address => '3600 Las Vegas Blvd S, Las Vegas, NV 89109',
        :notes => "this is a note unlike many others"
      }
    end
    
    assert_equal num_locations + 1, Location.count
    assert_redirected_to location_path(assigns(:location))
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
  
  test "get with a query param calls thinking_sphinx search" do
    # !!!!!! i can't get this one to work !!!!!!
    
    # flexmock(Location).should_receive(:paginate).and_return(
    #   [locations(:glenview)]
    # )
    # q = 'ruby'
    # get :index
    # assert_response :success
  end

end
