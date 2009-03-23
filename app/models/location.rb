class Location < ActiveRecord::Base
  include Geokit::Mappable
  acts_as_mappable 
  
  has_many :events 
  #has_many :groups, through => :events
  
  validates_presence_of :name, :address
end
