class AddGroupIdToLocations < ActiveRecord::Migration
  def self.up
    add_column :locations, :group_id, :integer
  end

  def self.down
    remove_column :locations, :group_id
  end
end
