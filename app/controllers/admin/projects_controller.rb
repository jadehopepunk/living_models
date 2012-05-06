module Admin
  class ProjectsController < AdminController
    active_scaffold :project do |config|
      list.columns = [:name, :published, :contact_email_address, :region, :website]
      show.columns.exclude :photos
      config.columns = [:id, :region_id]
      config.columns[:region_id].form_ui = :select
      update.columns = [:name, :contact_email_address, :website, :published, :summary, :region, :category]
      config.actions.exclude :create, :delete

      config.action_links.add 'spam', :type => :member, :page => true, :label => 'SPAM', :action => 'check_spam', :method => :get
    end

    def check_spam
      @project = Project.find(params[:id])
    end

    def confirm_spam
      @project = Project.find(params[:id])
      @project.mark_as_spam!
      flash[:notice] = "Spam deleted"
      redirect_to admin_projects_path
    end
  end
end