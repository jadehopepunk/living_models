# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

require 'site_sections'
require 'user_control'

class ApplicationController < ActionController::Base
  include SiteSections
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  include UserControl
  
  protected
  
    def access_denied
      flash[:warning] = "Access denied."
      redirect_to root_path
      false
    end

end
