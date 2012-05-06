class AddIsSpamToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :is_spam, :boolean, :default => false
  end

  def self.down
    remove_column :projects, :is_spam
  end
end
