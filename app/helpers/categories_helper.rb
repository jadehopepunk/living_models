module CategoriesHelper
  def category_filters
    Category.all.map do |category|
      category_icon_link(category)
    end.join(' ') + category_filters_script
  end
  
  def category_filters_script
    javascript_tag "var category_filters = new CategoryFilters()"
  end
  
  def category_icon_link(category)
    if category.has_data?
      link_to_function category_icon(category), "category_filters.toggleCategory(#{category.id}, this)", :id => dom_id(category)
    else
      no_data_category_icon(category)
    end
  end
  
  def category_link_url(category)
    if @category == category
      projects_path
    else
      projects_path(:category_id => category.id)
    end
  end
  
  def no_data_category_icon(category)
    category_icon(category, :class => 'category_icon no_data')
  end
  
  def category_icon(category, options = {})
    image_tag("category_icons/#{category.label}.jpg", {:alt => category.name, :title => category.name, :class => 'category_icon'}.merge(options))
  end
  
end