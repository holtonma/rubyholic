class AddLocationName < ActiveRecord::Migration
  def self.up
    add_column :locations, :name, :string
  end

  def self.down
    remove_column :locations, :name
  end
end


