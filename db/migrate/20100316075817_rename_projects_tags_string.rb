class RenameProjectsTagsString < ActiveRecord::Migration
  def self.up
    rename_column :projects, :tags, :existing_tag_string
  end

  def self.down
    rename_column :projects, :existing_tag_string, :tags
  end
end
