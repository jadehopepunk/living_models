class CreateUsersForExistingProjects < ActiveRecord::Migration
  def self.up
    Project.reset_column_information

    Project.all.each do |project|
      unless project.owner
        project.owner = User.find_or_create_by_email(project.contact_email_address.strip)
        project.save(false)
      end
    end
  end

  def self.down
  end
end
