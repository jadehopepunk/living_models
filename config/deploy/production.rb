set :deploy_to, "/home/ttnz/public_html/#{application}"
set :destination, "livingmodels.tt.craigambrose.com"
role :app, destination
role :web, destination
role :db,  destination, :primary => true

set :user, 'ttnz'