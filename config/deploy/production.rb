set :deploy_to, "/home/craig/#{application}/production"
set :destination, "alpha.enspiral.info"
role :app, destination
role :web, destination
role :db,  destination, :primary => true

set :user, 'craig'