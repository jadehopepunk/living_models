# Copy the assets into RAILS_ROOT/public/
FileUtils.cp_r( 
  Dir[File.join(File.dirname(__FILE__), 'public')], 
  File.join(Rails.root),
  :verbose => true
)

# Show the README text file
puts IO.read(File.join(File.dirname(__FILE__), 'README'))