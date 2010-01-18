class AddCategoryIdToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :category_id, :integer
    add_index :projects, :category_id
  end

  def self.down
    remove_index :projects, :category_id
    remove_column :projects, :category_id
  end
end
