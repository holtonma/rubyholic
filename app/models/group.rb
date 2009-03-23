class Group < ActiveRecord::Base
  has_many :events
  has_many :locations, :through => :events
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  define_index do
    indexes [:name, :description], :as => :group, :sortable => true
  end
  
  def self.find_all_groups(max, order_by_str='groups.name ASC')
    Group.find(:all, :include => {:locations => :events}, :limit => max, :order => order_by_str) 
  end
  
  def self.process_sort_params(asc_or_desc, col)
    # WHITELIST sort direction and/or columns
    # only directions are: ASC, DESC
    # for now, only columns to sort by are: groups.name, locations.name
    directions = ['asc', 'desc']
    cols = ['groups.name', 'locations.name']
    obfuscated_cols = ['g_name', 'loc_name']
    sortparams = {:direction => 'ASC', :column => 'groups.name'} #init, ASC by default
    
    dir_param = asc_or_desc.strip
    if directions.include?(dir_param)
      sortparams[:direction] = dir_param
    end
    
    col_param = col.strip
    if obfuscated_cols.include?(col_param)
      i_of_col = obfuscated_cols.index(col_param)
      sortparams[:column] = cols.fetch(i_of_col)
    end
    
    sortparams
  end
  
end
