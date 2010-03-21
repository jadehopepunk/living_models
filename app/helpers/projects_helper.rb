module ProjectsHelper
  def project_field(key)
    project_field_with_value(key, @project.send(key))
  end
  
  def project_field_with_value(key, value)
    content_tag :div, nil, :class => "field field_#{key}" do
      content_tag(:h4, key.humanize.titleize) + 
      content_tag(:div, value, :class => "field_value")      
    end
  end
  
  def project_display_fields
    %w(location category_name tag_list contact_name contact_email_address contact_phone website summary goals outcomes future_plans)
  end

  def tag_cloud(tags, classes)
    return [] if tags.empty?

    max_count = tags.map(&:count).max.to_f
    
    tags.map do |tag|
      if max_count == 1
        index = 0
      else
        index = (((tag.count - 1) / (max_count - 1)) * (classes.size - 1)).round
      end
      yield tag, classes[index]
    end
  end
    
end
