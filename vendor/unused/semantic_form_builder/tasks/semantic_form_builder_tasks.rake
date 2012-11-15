namespace :semantic_form_builder do

  desc "If the installation didn't copy the files correctly, use this task"
  task :setup do
    plugin_dir = File.join(File.dirname(__FILE__), '..')
    FileUtils.cp_r( 
      Dir[File.join(plugin_dir, 'public')], 
      File.join(Rails.root),
      :verbose => true
    )
    puts "Finished."
  end
end
