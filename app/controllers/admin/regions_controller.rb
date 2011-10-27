module Admin
  class RegionsController < AdminController
    active_scaffold :region do |config|  
  #    config.list.columns = config.create.columns = config.update.columns = [:name]  
      config.columns = [:name]      
    end  
  end
end
