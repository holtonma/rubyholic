class ChangeLatitudeSpelling < ActiveRecord::Migration
  def self.up
    rename_column :locations, :lattitude, :latitude
  end

  def self.down
    rename_column :locations, :lattitude, :latitude
  end
end




