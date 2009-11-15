set :stages, %w(production)
set :default_stage, "production"

require 'capistrano/ext/multistage'

set :application, "living_models"
set :repository,  "git@github.com:craigambrose/living_models.git"
set :scm, "git"
set :branch, "master" unless exists?(:branch)

namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end