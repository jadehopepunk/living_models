ActionController::Routing::Routes.draw do |map|
  map.resources :projects, :has_many => :photos
  map.resources :photos
  map.root :controller => "projects"
end
