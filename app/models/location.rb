class Location < ActiveRecord::Base
  include Geokit::Mappable
  acts_as_mappable 
  
  has_one :event #has_many :groups, through => :events
  
  validates_presence_of :name, :address
end
