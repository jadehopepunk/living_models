module Admin
  class CategoriesController < AdminController
    active_scaffold :categories do |config|
      config.columns = [:name, :description]      
    end
  
  end
end