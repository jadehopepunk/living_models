class ConvertExistingTagsToTaggables < ActiveRecord::Migration
  class Project < ActiveRecord::Base
    acts_as_taggable_on :tags
  end
  
  def self.up
    Project.all.each do |project|
      project.tag_list = project.existing_tag_string
      project.save
    end
    execute "UPDATE taggings SET taggable_type = 'Project'"
  end

  def self.down
  end
end
