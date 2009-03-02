class ModifyLocationTable < ActiveRecord::Migration
  def self.up
    remove_column :locations, :city
    remove_column :locations, :address1
    remove_column :locations, :address2
    remove_column :locations, :state
    remove_column :locations, :group_id
    add_column :locations, :address, :text
  end

  def self.down
    add_column :locations, :city, :string
    add_column :locations, :address1, :string
    add_column :locations, :address2, :string
    add_column :locations, :state, :string
    remove_column :locations, :address
    add_column :locations, :group_id, :integer
  end
  
end
