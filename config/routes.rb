ActionController::Routing::Routes.draw do |map|
  map.login "login", :controller => :user_sessions, :action => :new
  map.logout 'logout', :controller => :user_sessions, :action => :destroy
  
  map.resources :projects, :has_many => :photos
  map.resources :photos, :user_sessions, :users
  
  map.namespace :admin do |admin|
    admin.resources :users, :projects, :photos, :active_scaffold => true  
  end
  map.root :controller => "projects"
end
