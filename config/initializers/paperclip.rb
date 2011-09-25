Paperclip.options[:command_path] = ENV['IMAGEMAGICK_ROOT']
Paperclip.options[:command_path] = %x[which identify].strip.gsub(/\/identify$/, '') if Paperclip.options[:command_path].blank? 
Paperclip.options[:command_path] = '/opt/local/bin' if Paperclip.options[:command_path].blank?
