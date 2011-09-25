class AddRegionToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :region, :string, :length => 100
  end

  def self.down
    remove_column :projects, :region
  end
end
