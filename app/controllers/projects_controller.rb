class ProjectsController < InheritedResources::Base
  before_filter :require_admin, :except => [:new, :create, :index, :show]

  protected

    def collection
      @projects ||= end_of_association_chain.published.paginate(:page => params[:page])
    end
  
end
