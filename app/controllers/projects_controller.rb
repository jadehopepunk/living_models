class ProjectsController < ApplicationController
  
  def index
  end
  
  def new
    @project = Project.new(params[:project])
  end
  
end
