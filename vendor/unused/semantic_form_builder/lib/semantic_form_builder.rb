class SemanticFormBuilder < ActionView::Helpers::FormBuilder
  include SemanticFormHelper

  def field_settings(method, options = {}, tag_value = nil)
    field_name = "#{@object_name}_#{method.to_s}"
    default_label = tag_value.nil? ? method.to_s.humanize : tag_value.to_s.humanize
    label = options[:label] ? options.delete(:label) : default_label
    options[:class] ||= ""
    options[:class] += options[:required] ? " required" : ""
    label += "<strong><sup>*</sup></strong>" if options[:required]
    options.delete(:required)
    [field_name, label, options]
  end
  
  def self.create_labelled_field(method_name)
    define_method(method_name) do |method, *args|
      options = args.first || {}
      field_name, label, options = field_settings(method, options)
      wrapping("text", field_name, label, super(*args), options)      
    end
  end

  (field_helpers + ['textile_editor'] - ['hidden_field']).uniq.each do |name|
    create_labelled_field(name) unless name == 'hidden_field'
  end
    
  def radio_button(method, tag_value, options = {})
    field_name, label, options = field_settings(method, options)
    wrapping("radio", field_name, label, super, options)
  end

  def check_box(method, options = {}, checked_value = "1", unchecked_value = "0")
    field_name, label, options = field_settings(method, options)
    wrapping("check-box", field_name, label, super, options)
  end

  def select(method, choices, options = {}, html_options = {})
    field_name, label, options = field_settings(method, options)
    wrapping("select", field_name, label, super, options)
  end

  def time_zone_select(method, choices, options = {}, html_options = {})
    field_name, label, options = field_settings(method, options)
    # wrapping("time-zone-select", field_name, label, super, options)
    select_box = this_check_box = @template.select(@object_name, method, choices, options.merge(:object => @object), html_options)
    wrapping("time-zone-select", field_name, label, select_box, options)
  end
  
  def time_select(method, options = {})
    field_name, label, options = field_settings(method, options)
    wrapping("datetime", field_name, label, super, options)
  end
  
  def submit(method, options = {})
    field_name, label, options = field_settings(method, options.merge( :label => "&nbsp;"))
    wrapping("submit", field_name, label, super, options)
  end

  def submit_and_cancel(submit_name, cancel_name, options = {})
    submit_button = @template.submit_tag(submit_name, options.merge(:name => "commit", :class => "submit"))
    cancel_button = @template.submit_tag(cancel_name, options.merge(:name => "cancel", :class => "cancel"))
    wrapping("submit", nil, "", submit_button+cancel_button, options)
  end
  
  def submit_button_tag(value = "Save", options = {})
    
    html_options = {}
    if options
      html_options = options.stringify_keys
      html_options.delete('href')
      html_options.delete('alt')
      html_options.delete('confirm')
      # convert_options_to_javascript!(html_options)
    end
    
    @template.tag(:button, { :type => "submit", :class => "positive", :value => value }.update(html_options), true) +
      @template.image_tag("tick.png", { :alt => value })  + value +
    "</button>"
  end

  def cancel_button_tag(value = "Cancel", options = {})
    
    html_options = {}
    if options
      html_options = options.stringify_keys
      href = html_options['href']
      # convert_options_to_javascript!(html_options)
    end
    
    @template.tag(:a, { :class => "negative", :value => value }.update(html_options), true) +
      @template.image_tag("cross.png", { :alt => value })  + value +
    "</a>"
  end
  
  def submit_and_cancel_buttons(submit_name = "Save", cancel_name = 'Cancel', options = {})
    submit_button = submit_button_tag(submit_name, options)
    cancel_button = cancel_button_tag(cancel_name, options)
    wrapping("submit", nil, "", submit_button+cancel_button, options)
  end
  
  def radio_button_group(method, values, options = {})
    selections = []
    values.each do |value|
      if value.is_a?(Hash)
        tag_value = value[:value]
        value_text = value[:label]
        help = value.delete(:help)
      else
        tag_value = value
        value_text = value
      end
      radio_button = @template.radio_button(@object_name, method, tag_value, options.merge(:object => @object, :help => help))
      selections << boolean_field_wrapper(
                        radio_button, "#{@object_name}_#{method.to_s}",
                        tag_value, value_text)
    end
    selections
    field_name, label, options = field_settings(method, options)
    semantic_group("radio", field_name, label, selections, options)
  end

  def check_box_group(method, values, options = {})
    selections = []
    values.each do |value|
      if value.is_a?(Hash)
        checked_value = value[:checked_value]
        unchecked_value = value[:unchecked_value]
        label = value[:label]
        help = value.delete(:help)
      else
        checked_value = 1
        unchecked_value = 0
        value_text = value
      end
      check_box = @template.check_box(@object_name, method, options.merge(:object => @object), checked_value, unchecked_value)
      selections << boolean_field_wrapper(
                        check_box, "#{@object_name}_#{method.to_s}",
                        checked_value, value_text)
    end
    field_name, label, options = field_settings(method, options)
    semantic_group("check-box", field_name, label, selections, options)
  end
end
