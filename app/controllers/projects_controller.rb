class ProjectsController < InheritedResources::Base
  before_filter :require_admin, :except => [:new, :create, :index, :show]

  def index
    collection
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  protected

    def collection
      @projects ||= end_of_association_chain.for_categories(category_ids).for_regions(region_names).published.paginate(:page => params[:page])
    end
    
    def category_ids
      filter_set(:category_ids)
    end
    
    def region_names
      filter_set(:region_names)
    end
    
    def filter_set(key)
      params[key] ? params[key].split(',') : []
    end
        
end
