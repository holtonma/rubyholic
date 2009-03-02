class Group < ActiveRecord::Base
  has_many :events
  has_many :locations, :through => :events
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  def self.find_all_groups(max, order_by_str='groups.name ASC')
    Group.find(:all, :include => :locations, :limit => max, :order => order_by_str) 
  end
  
end
