require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  
  test "group contains name" do
    g = groups(:one)
    g.name = ""
    assert ! g.valid?
    assert g.errors.on(:name)
  end
  
end

