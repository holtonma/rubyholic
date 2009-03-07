class Location < ActiveRecord::Base
  has_one :event #has_many :groups, through => :events
  
  validates_presence_of :name, :address
end
