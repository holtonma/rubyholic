class CleanUpLocationsAndEvents < ActiveRecord::Migration
  def self.up
    remove_column :locations, :group_id
    add_column :events, :group_id, :integer
    add_column :events, :location_id, :integer
  end

  def self.down
    add_column :locations, :group_id, :integer
    remove_column :events, :group_id
    remove_column :events, :locaiton_id
  end
end



