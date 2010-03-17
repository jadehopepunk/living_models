class ProjectsController < InheritedResources::Base
  before_filter :require_admin, :except => [:new, :create, :index, :show]

  def index
    load_tag_cloud
    collection
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  protected

    def load_tag_cloud
      @tags = Project.top_tags(30).sort_by(&:name)
    end

    def collection
      @projects ||= end_of_association_chain.for_categories(category_ids).published.paginate(:page => params[:page])
    end
    
    def category_ids
      params[:category_ids] ? params[:category_ids].split(',') : []
    end
        
end
