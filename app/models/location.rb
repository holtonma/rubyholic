class Location < ActiveRecord::Base
  include Geokit::Mappable
  include Geokit::Geocoders
  
  acts_as_mappable :auto_geocode=>{:field=>:address, :error_message=>'Could not geocode address.  Check the validity and try again.'}
  
  has_many :events 
  #has_many :groups, through => :events
  
  validates_presence_of :name, :address, :lat, :lng
  
  # could create a before_validation_on_create filter, which checked if there was more than one address found
  # if so, present options to the user to click the option they were intending
  # also could use the result from the Geocoder to clean up the user's garbled input string (for later)
end
