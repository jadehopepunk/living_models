Paperclip.options[:command_path] = %x[which identify].strip.gsub(/\/identify$/, '')
