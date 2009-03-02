class Event < ActiveRecord::Base
  belongs_to :group
  belongs_to :location
  
  validates_presence_of :name, :start_date, :end_date, :group_id, :location_id
  
  validates_numericality_of :group_id, :location_id
  
end
