class ProjectsController < InheritedResources::Base
  before_filter :require_admin, :except => [:new, :create, :index, :show]
  before_filter :require_owner, :only => [:edit, :update]

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
      parent_scope.for_categories(category_ids).for_regions(region_ids).tagged_with(tags, :any => true)
    end
    
    def category_ids
      filter_set(:category_ids)
    end
    
<<<<<<< HEAD
    def region_names
      filter_set(:region_names)
    end
=======
#    def region_names
#      filter_set(:region_names)
#    end
    
    def region_ids
      filter_set(:region_ids)
    end
    # END 16 September 2011
>>>>>>> d61dc80ac36216a57897abf23172e14d28d0a2f8
    
    def tags
      filter_set(:tags)
    end
    
    def filter_set(key)
      params[key] ? params[key].split(',') : []
    end
    
    def require_owner
      return access_denied unless resource.can_be_edited_by?(current_user)
    end

end
