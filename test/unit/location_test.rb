require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  
  test "location contains name" do
    l = locations(:one)
    l.name = ""
    assert ! l.valid?
    assert l.errors.on(:name)
  end
  
  test "location contains address" do
    l = locations(:one)
    l.address = ""
    assert ! l.valid?
    assert l.errors.on(:address)
  end
  
end
