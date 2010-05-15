ActionController::Routing::Routes.draw do |map|
  map.login "login", :controller => :user_sessions, :action => :new
  map.logout 'logout', :controller => :user_sessions, :action => :destroy
  
  map.resources :projects, :has_many => :photos
  map.resources :photos, :user_sessions
  map.resources :users, :member => {:activate => :get, :edit_password => :get, :update_password => :put}
  
  map.namespace :admin do |admin|
    admin.resources :users, :projects, :photos, :categories, :active_scaffold => true  
  end

  map.resource :about, :controller => "about"

  map.root :controller => "projects"
end
