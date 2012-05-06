
desc "Make local develoment site look like the live site"
task :sync => [:environment] do
  host = 'ttnz@tt.craigambrose.com'
  path = '/home/ttnz/public_html/living_models/current'

  db_config = YAML.load_file('config/database.yml')

  system "ssh #{host} \"mysqldump -u #{db_config['production']["username"]} -p#{db_config['production']["password"] } -Q --add-drop-table -O add-locks=FALSE -O lock-tables=FALSE #{db_config['production']["database"]} > ~/dump.sql\""
  system "rsync -az --progress #{host}:~/dump.sql ./db/production_data.sql"
  system "mysql -u #{db_config['development']["username"]} #{db_config['development']["database"]} < ./db/production_data.sql"
  rm_rf "./db/production_data.sql"
  system "rsync -az --progress #{host}:#{path}/public/system/ ./public/system"
  # system "rsync -az --progress #{host}:#{path}/private/ ./private"
end
