module FormHelper
  def textile_editor_input(f, method_name, options = {})
    classes = ['textile']
    classes << 'required' if options[:required]
    hint = ''
    if options[:hint]
      hint = content_tag(:p, options[:hint], :class => 'inline-hints')
    end
    
    result = content_tag(:li, :class => 'textile required') do
      content_tag(:label, :for => "#{f.object_name}_#{method_name}") do
        label_contents = options[:label] || method_name.to_s.humanize
        label_contents += " <abbr title=\"required\">*</abbr>" if options[:required]
        label_contents.html_safe
      end + content_tag(:div, :class => 'input_container') do
        f.textile_editor(method_name, options)
      end.html_safe + hint.html_safe
    end
    result.html_safe
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
    end
    
    @template.tag(:a, { :class => "negative", :value => value }.update(html_options), true) +
      @template.image_tag("cross.png", { :alt => value })  + value +
    "</a>"
  end

  def wrapping(type, field_name, label, field, options = {})
    help = %Q{<span class="help">#{options[:help]}</span>} if options[:help]
    to_return = []
    to_return << %Q{<div class="#{type}-field #{options[:class]}">}
    to_return << %Q{<label for="#{field_name}">#{label}#{help}</label>} unless ["radio","check", "submit"].include?(type)
    to_return << %Q{<div class="old_wrapper_input">}
    to_return << options[:before] if options[:before]
    to_return << field
    to_return << options[:after] if options[:after]
    to_return << %Q{<label for="#{field_name}">#{label}</label>} if ["radio","check"].include?(type)    
    to_return << %Q{</div></div>}
    to_return.join('')
  end

  def submit_and_cancel_buttons(submit_name = "Save", cancel_name = 'Cancel', options = {})
    submit_button = submit_button_tag(submit_name, options)
    cancel_button = cancel_button_tag(cancel_name, options)
    wrapping("submit", nil, "", submit_button+cancel_button, options)
  end

end