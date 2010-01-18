class ProjectsController < InheritedResources::Base
  before_filter :load_category
  before_filter :require_admin, :except => [:new, :create, :index, :show]

  protected

    def collection
      @projects ||= end_of_association_chain.published.paginate(:page => params[:page])
    end

    def begin_of_association_chain
      @category
    end
    
    def load_category
      @category = Category.find(params[:category_id]) if params[:category_id]
    end
  
end
