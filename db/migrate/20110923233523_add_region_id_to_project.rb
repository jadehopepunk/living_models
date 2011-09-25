class AddRegionIdToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :region_id, :integer
  end

  def self.down
    remove_column :projects, :region_id
  end
end
