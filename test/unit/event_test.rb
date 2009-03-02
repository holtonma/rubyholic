require 'test_helper'

class EventTest < ActiveSupport::TestCase
  
  test "event contains name" do
    e = events(:one)
    e.name = ""
    assert ! e.valid?
    assert e.errors.on(:name)
  end
  
  test "event contains start_date" do
    e = events(:one)
    e.start_date = ""
    assert ! e.valid?
    assert e.errors.on(:start_date)
  end
  
  test "event contains end_date" do
    e = events(:one)
    e.end_date = ""
    assert ! e.valid?
    assert e.errors.on(:end_date)
  end
  
  test "event contains group_id" do
    e = events(:one)
    e.group_id = ""
    assert ! e.valid?
    assert e.errors.on(:group_id)
  end
  
  test "event contains location_id" do
    e = events(:one)
    e.location_id = ""
    assert ! e.valid?
    assert e.errors.on(:location_id)
  end
  
end
