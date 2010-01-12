ActionController::Routing::Routes.draw do |map|
  map.login "login", :controller => :user_sessions, :action => :new
  map.logout 'logout', :controller => :user_sessions, :action => :destroy
  
  map.resources :projects, :has_many => :photos
  map.resources :photos
  map.resources :user_sessions
  map.root :controller => "projects"
end
