class Location < ActiveRecord::Base
  #belongs_to :groups #for now, will change it later
  has_one :event
end
