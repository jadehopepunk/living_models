module CategoriesHelper
  def category_icon_link(category)
    link_to category_icon(category), category_link_url(category)
  end
  
  def category_link_url(category)
    if @category == category
      projects_path
    else
      projects_path(:category_id => category.id)
    end
  end
  
  def category_icon(category)
    image_tag('categories/sample.gif', :alt => category.name, :title => category.name, :class => category_icon_css_class(category))
  end
  
  def category_icon_css_class(category)
    classes = ['category_icon']
    classes << 'no_data' unless category.has_data?
    classes.join(' ')
  end
end