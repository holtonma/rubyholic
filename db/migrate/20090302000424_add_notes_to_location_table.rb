class AddNotesToLocationTable < ActiveRecord::Migration
  def self.up
    add_column :locations, :notes, :text
  end

  def self.down
    remove_column :locations, :notes
  end
end
