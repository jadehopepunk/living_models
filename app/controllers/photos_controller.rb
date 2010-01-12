class PhotosController < InheritedResources::Base
  before_filter :require_admin, :except => [:new, :create, :index, :show]
  belongs_to :project
  
end
