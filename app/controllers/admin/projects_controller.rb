module Admin
  class ProjectsController < AdminController
    active_scaffold :project do |config|
      list.columns = [:name, :published, :contact_email_address, :website]
      show.columns.exclude :photos
      update.columns = [:name, :contact_email_address, :website, :published]
      config.actions.exclude :create, :delete
    end
  
  end
end