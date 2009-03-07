require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  
  test "group contains name" do
    g = groups(:sea)
    g.name = ""
    assert ! g.valid?
    assert g.errors.on(:name)
  end
  
  test "passing in a value of 'desc' and 'g_name' should short descending on group name" do
    g = groups(:sea)
    sort_params = Group.process_sort_params("desc", "g_name")
    assert_equal 'desc', sort_params[:direction]
    assert_equal 'groups.name', sort_params[:column]
  end
  
  test "passing in a value of 'asc' and 'l_name' should short ascending on location name" do
    g = groups(:sea)
    sort_params = Group.process_sort_params("asc", "loc_name")
    assert_equal 'asc', sort_params[:direction]
    assert_equal 'locations.name', sort_params[:column]
  end
  
  test "groups need unique names" do
    g = groups(:glen)
    group = Group.new(:name => g.name, :description => g.description)
    assert ! group.valid? 
    assert_equal "has already been taken", group.errors.on(:name)
  end
  
  
  
end

