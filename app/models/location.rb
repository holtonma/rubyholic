class Location < ActiveRecord::Base
  has_one :event
  
  validates_presence_of :name, :address
end
