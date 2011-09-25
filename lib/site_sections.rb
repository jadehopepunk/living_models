module SiteSections
  # def self.included(controller)
  # end
  
  protected
  
    def self.site_section(section, options = {})
      before_filter(options) do |controller|
        controller.send(:site_section=, section)
      end
    end
  
    def site_section=(section)
      @site_section = section
    end
    
    
end