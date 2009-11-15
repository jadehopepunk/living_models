module ProjectsHelper
  def project_field(key)
    content_tag :div, nil, :class => "field field_#{key}" do
      content_tag(:h4, key.humanize.titleize) + 
      content_tag(:div, @project.send(key), :class => "field_value")      
    end
  end
  
  def project_display_fields
    %w(location category tags contact_name contact_email_address contact_phone website summary goals outcomes future_plans)
  end
    
end
