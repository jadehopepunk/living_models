class ProjectsController < InheritedResources::Base
  before_filter :require_admin, :except => [:new, :create, :index, :show]
  
end
