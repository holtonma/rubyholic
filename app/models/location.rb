class Location < ActiveRecord::Base
  has_one :event
end
