ActionController::Routing::Routes.draw do |map|
  map.resources :projects, :has_many => :photos
  map.resources :photos
  map.resources :user_sessions
  map.root :controller => "projects"
end
