module FiltersHelper
  def category_filters
    Category.all.map do |category|
      category_icon_link(category)
    end.join(' ')
  end
  
  def filters_javascript
    # [category_filters_script].join("\n")
  end
  
  def category_filters_script
  end
  
  def category_icon_link(category)
    if category.has_data?
      link_to_function category_icon(category), "", :id => dom_id(category), :class => 'toggle_category'
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
  
# STEF JONGKIND 16 September 2011
#  def region_image
#    image_tag 'maps/nz/none.png', :usemap => '#region_map', :id => 'region_map_image'
#  end
  
  def region_image
    image_tag 'maps/nz/region_map.png', :usemap => '#region_map', :id => 'region_map_image'
  end
  
#  def region_image_map
#    north = region_image_map_area("North Island", "53,1,126,3,122,94,88,96,70,71")
#    south = region_image_map_area("South Island", "59,72,82,84,85,103,84,165,8,173,3,150,5,73")
#    content_tag(:map, north + south, :name => 'region_map', :id => 'region_map')
#  end
  
  def region_image_map
    northland = region_image_map_area("Northland", "71,3,85,13,87,27,77,18")
    auckland = region_image_map_area("Auckland", "90,25,97,34,90,40,86,30")
    coromandel = region_image_map_area("Coromandel", "97,25,103,35,101,38,98,33")
    bayofplenty = region_image_map_area("Bay of Plenty", "102,41,104,47,109,52,108,58,115,59,119,56,119,53,126,47")
    eastland = region_image_map_area("Eastland", "128,42,131,43,130,51,125,59,119,53,126,46")
    waikato = region_image_map_area("Waikato", "91,41,97,38,102,41,104,49,110,54,107,58,104,60,100,51,97,54,90,56,91,40")
    hawkesbay = region_image_map_area("Hawkes Bay", "110,78,107,68,104,62,110,59,116,58,120,56")
    taranaki = region_image_map_area("Taranaki", "90,58,92,64,94,67,93,71,79,65,88,59")
    taupo = region_image_map_area("Taupo", "99,65,99,61,103,61,103,64")
    manawatu = region_image_map_area("Manawatu", "99,53,101,59,98,62,97,66,102,66,105,65,107,70,106,73,110,79,107,82,96,82,94,66,95,55,99,53")
    wellington = region_image_map_area("Wellington", "94,83,101,79,98,86,95,91,90,90")
    wairarapa = region_image_map_area("Wairarapa", "101,83,104,84,107,84,104,90,98,94,97,91,99,86")
    westcoast = region_image_map_area("West Coast", "67,81,64,85,57,95,45,113,29,125,38,126,58,111,66,105,64,98,67,94,69,88,67,81")
    nelsontasman = region_image_map_area("Nelson Tasman", "71,84,71,88,69,93,64,98,67,103,72,95,73,93,76,90")
    marlborough = region_image_map_area("Marlborough", "81,84,77,89,73,95,70,102,73,105,78,101,83,99,83,93,83,90,85,86")
    canterbury = region_image_map_area("Canterbury", "82,99,74,107,70,104,57,111,44,121,38,128,35,136,40,135,42,138,46,141,51,139,56,130,65,125,73,125,73,121,70,119,74,112,83,100")
    otago = region_image_map_area("Otago", "37,127,34,136,40,137,46,141,51,141,47,152,34,163,31,151,31,145,28,147,21,139,21,130,27,126,35,127")
    southland = region_image_map_area("Southland", "19,132,22,142,26,147,31,145,30,152,32,163,4,155,4,150,19,132")
    stewartisland = region_image_map_area("Stewart Island", "16,163,21,169,14,173,15,165")
    
    content_tag(:map, northland + auckland + coromandel + bayofplenty + eastland + waikato + hawkesbay + taranaki + taupo + manawatu + wellington + wairarapa + westcoast + nelsontasman + marlborough + canterbury + otago + southland + stewartisland, :name => 'region_map', :id => 'region_map')
  end

#  def region_image_map_area(name, coords)
#    tag(:area, :href => "#", :alt => name, :title => name, :shape => "poly", :coords => coords, :onclick => "filters.toggleRegion('#{name}'); return false;")
#  end
  def region_image_map_area(name, coords)
    tag(:area, :href => "#", :alt => name, :title => name, :shape => "poly", :coords => coords, :onclick => "filters.toggleRegion('#{name}', #{get_region_id_from_name(name)}); return false;")
  end
  
  def get_region_id_from_name(name)
    region = Region.find_by_name(name)
    return region.id unless region.blank?
  end
  
# END STEF JONGKIND 16 September 2011

  def tag_filters
    tags = Project.top_tags(30).sort_by(&:name)
    tag_cloud(tags, %w(tag1 tag2 tag3)) do |tag, css_class|
      link_to_function tag.name, '', :class => css_class + ' toggle_tag'
    end.join(' ')
  end
  
end