module FiltersHelper
  def category_filters
    Category.all.map do |category|
      category_icon_link(category)
    end.join(' ')
  end
  
  def filters_javascript
    [category_filters_script].join("\n")
  end
  
  def category_filters_script
    javascript_tag "var filters = new Filters()"
  end
  
  def category_icon_link(category)
    if category.has_data?
      link_to_function category_icon(category), "filters.toggleCategory(this)", :id => dom_id(category)
    else
      no_data_category_icon(category)
    end
  end
  
  def no_data_category_icon(category)
    category_icon(category, :class => 'category_icon no_data')
  end
  
  def category_icon(category, options = {})
    image_tag("category_icons/#{category.label}.jpg", {:alt => category.name, :title => category.name, :class => 'category_icon'}.merge(options))
  end
  
  def region_filters
    region_image + 
    region_image_map
  end
  
  def region_image
    image_tag 'maps/nz/none.png', :usemap => '#region_map'
  end
  
  def region_image_map
    north = region_image_map_area("North Island", "53,1,126,3,122,94,88,96,70,71")
    south = region_image_map_area("South Island", "59,72,82,84,85,103,84,165,8,173,3,150,5,73")
    content_tag(:map, north + south, :name => 'region_map', :id => 'region_map')
  end
  
  def region_image_map_area(name, coords)
    tag(:area, :href => "#", :alt => name, :title => name, :shape => "poly", :coords => coords, :onclick => "filters.toggleRegion('#{name}'); return false;")
  end
  
end