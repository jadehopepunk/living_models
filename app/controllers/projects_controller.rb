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
      @projects ||= filtered_scope(end_of_association_chain).published.paginate(:page => params[:page], :order => "created_at DESC")
    end
    
    def filtered_scope(parent_scope)
      parent_scope.for_categories(category_ids).for_regions(region_names).tagged_with(tags, :any => true)
    end
    
    def category_ids
      filter_set(:category_ids)
    end
    
    def region_names
      filter_set(:region_names)
    end
    
    def tags
      filter_set(:tags)
    end
    
    def filter_set(key)
      params[key] ? params[key].split(',') : []
    end
        
end
