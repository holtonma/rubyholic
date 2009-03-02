require 'test_helper'
require 'nokogiri'

class GroupsControllerTest < ActionController::TestCase
  
  fixtures :groups 
  
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:groups)
    assert_template "index"
    
    # doc = Nokogiri::XML(@response.body)
    # puts doc 
    
    assert_tag :tag => 'h1', :content => "Rubyholic groups"
    assert_tag :tag => 'table'
    assert_select "table" do 
      assert_select "th", :count => 10 #10 column table
    end
    
    assert_select "title", "My name is [ ____ ] and I am a Rubyholic"
    assert_tag :tag => 'a', :content => "New group"
    
    num_data_rows = Group.find_all_groups(10).length
    assert_equal assigns(:groups).length, Group.find_all_groups(10).length
    assert_equal 2, assigns(:groups).length
    
    assert_select "table tr", 1+num_data_rows
    
    assert_select "input[type*=submit]", :count => num_data_rows
    assert_select "td", :count => 10*num_data_rows
    assert_select "a", :count => 1 + (num_data_rows*2)
    assert_select "th", :count => 10
        
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group" do
    # assert_difference('Group.count') do
    #   post :create, :group => { }
    # end

    #assert_redirected_to group_path(assigns(:group))
  end

  test "should show group" do
    get :show, :id => groups(:sea).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => groups(:glen).id
    assert_response :success
  end

  test "should update group" do
    put :update, :id => groups(:sea).id, :group => { }
    assert_redirected_to group_path(assigns(:group))
  end

  test "should destroy group" do
    assert_difference('Group.count', -1) do
      delete :destroy, :id => groups(:sea).id
    end

    assert_redirected_to groups_path
  end
end
