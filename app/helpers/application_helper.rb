# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def site_section_link(id, text, path, options = {})
    classes = ['site_section']
    classes << 'active' if id == @site_section
    options[:class] = [options[:class], classes].flatten.compact.join(' ')
    options[:id] = id
    link_to(content_tag(:span, text), path, options)
  end    

end
