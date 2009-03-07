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
    
    assert_tag :tag => 'h1', :content => "Rubyholic"
    assert_tag :tag => 'h2', :content => "All Groups"
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
    
    num_sort_links = 4
    num_newGroup_links = 1
    assert_select "a", :count => num_newGroup_links + num_sort_links + (num_data_rows*2)
    assert_select "th", :count => 10
  end
  
  test "when index is sorted DESC by Location name it should sort accordingly" do
    get :index, :direction => 'desc', :order => 'loc_name'
    assert_response :success
    assert_not_nil assigns(:groups)
    assert_template "index"
    
    num_data_rows = Group.find_all_groups(10).length
    assert_select "table tr", 1+num_data_rows
    
    groups = Group.find_all_groups(10, 'locations.name DESC')
    
    #sort one way
    assert_select "table tr td:first-of-type", "#{assigns(:groups).first.name}"
    
    #sort another way
    get :index, :direction => 'asc', :order => 'loc_name'
    assert :success
    assert_template "index"
    assert_select "table tr td:first-of-type", "#{assigns(:groups).first.name}"
    
    #sort another way
    get :index, :direction => 'desc', :order => 'g_name'
    assert :success
    assert_template "index"
    assert_select "table tr td:first-of-type", "#{assigns(:groups).last.name}"
    
    # hrmm... not liking the way I tested this
    
    
  end
  

  test "should get new" do
    get :new
    assert_response :success
    assert_template 'new'
    assert_tag :tag => 'h1', :content => "Rubyholic"
    assert_tag :tag => 'h2', :content => "New Group"
    assert_select 'input', :count => 2
    assert_select "textarea", :count => 1
    assert_select "a", :count => 1
    assert_tag :tag => 'a', :content => "Back"
  end

  test "should create group" do
    # assert_difference('Group.count') do
    #   post :create, :group => { }
    # end

    #assert_redirected_to group_path(assigns(:group))
  end

  test "should show group" do
    #make sure the group name is there, and the description via assert_match
    get :show, :id => groups(:sea).id
    assert_response :success
    assert_template 'show'
    assert_tag :tag => 'h1', :content => "Rubyholic"
    assert_tag :tag => 'h2', :content => "Group: #{groups(:sea).name}"
    assert_select "p", :count => 2 
    assert_select "a", :count => 2
    assert_select "p:last-of-type", "Description: #{groups(:sea).description}"
    
  end

  test "should get edit" do
    get :edit, :id => groups(:glen).id
    assert_response :success
    assert_template 'edit'
    assert_tag :tag => 'h1', :content => 'Rubyholic'
    assert_tag :tag => 'h2', :content => 'Editing group'
    assert_select "label", "Description"
    assert_select "label", "Name"
    assert_select "p", :count => 4
    assert_select 'input', :count => 3
    assert_select 'textarea', :count => 1
    assert_select "input#group_name", "#{groups(:glen).name}"
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
