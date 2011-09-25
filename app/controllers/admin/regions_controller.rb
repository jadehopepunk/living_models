# STEF JONGKIND 16 September 2011
class Admin::RegionsController < ApplicationController
  active_scaffold :region do |config|  
    config.list.columns = config.create.columns = config.update.columns = [:name]  
  end  
  
end
