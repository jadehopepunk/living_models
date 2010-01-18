class RemoveCategoryNameFromProjects < ActiveRecord::Migration
  def self.up
    remove_column :projects, :category
  end

  def self.down
    add_column :projects, :category, :string
  end
end
