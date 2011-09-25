module Admin
  class ProjectsController < AdminController
    active_scaffold :project do |config|
      list.columns = [:name, :published, :contact_email_address, :region, :website]
      show.columns.exclude :photos
# STEF JONGKIND 16 September 2011
# update.columns = [:name, :contact_email_address, :website, :published]
      config.columns = [:id, :region_id]
      config.columns[:region_id].form_ui = :select
      update.columns = [:name, :contact_email_address, :region, :website, :published]
# END 16 September 2011
      config.actions.exclude :create, :delete
    end
  
  end
  
end