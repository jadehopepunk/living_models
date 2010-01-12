module Admin
  class ProjectsController < AdminController
    active_scaffold :project do |config|
      list.columns = [:name, :contact_email_address, :website]
      show.columns.exclude :photos
      config.actions.exclude :create, :update, :delete
    end
  
  end
end