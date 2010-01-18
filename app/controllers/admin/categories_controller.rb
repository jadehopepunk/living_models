module Admin
  class CategoriesController < AdminController
    active_scaffold :categories do |config|
      list.columns = [:name, :description]
    end
  
  end
end