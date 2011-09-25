class PhotosController < InheritedResources::Base
  belongs_to :project
  before_filter :require_admin, :except => [:new, :create, :index, :show, :destroy]
  before_filter :require_owner, :only => [:edit, :update, :new, :create, :destroy]
  
  respond_to :js, :only => :destroy

  protected

    def require_owner
      end_of_association_chain
      return access_denied unless @project.can_be_edited_by?(current_user)
    end

end
