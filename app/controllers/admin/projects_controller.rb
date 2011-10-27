module Admin
  class ProjectsController < AdminController
    active_scaffold :project do |config|
      list.columns = [:name, :published, :contact_email_address, :region, :website]
      show.columns.exclude :photos
      config.columns = [:id, :region_id]
      config.columns[:region_id].form_ui = :select
      update.columns = [:name, :contact_email_address, :website, :published, :summary, :region, :category]
      config.actions.exclude :create, :delete
    end
  end
end