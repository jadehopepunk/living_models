# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def site_section_link(id, text, path, options = {})
    classes = ['site_section']
    classes << 'active' if id == @site_section
    options[:class] = [options[:class], classes].flatten.compact.join(' ')
    options[:id] = id
    link_to(content_tag(:span, text), path, options)
  end    

  def flash_div(key = nil)
    keys = key ? [key] : flash.keys
    rows = keys.collect { |key| content_tag(:div, content_tag(:div, flash[key], :class => 'wrap'), {:id => key, :class => "flashMessage #{key}"}) if flash[key] }
    content_tag(:div, rows.join("\n"), :class => 'flashMessages', :id => 'flash_container')
  end
  
  def with_protocol(url)
    regex = /^https?:\/\//
    (url =~ regex) ? url : "http://#{url}"
  end

  def without_protocol(url)
    regex = /^https?:\/\//
    (url =~ regex) ? url.sub(regex, '') : url
  end

end
