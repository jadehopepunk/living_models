set :user, 'realsolutions'
set :deploy_to, "/home/#{user}/production"
set :destination, "alpha.enspiral.info"
role :app, destination
role :web, destination
role :db,  destination, :primary => true
