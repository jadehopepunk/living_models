ActionController::Routing::Routes.draw do |map|
  map.login "login", :controller => :user_sessions, :action => :new
  map.logout 'logout', :controller => :user_sessions, :action => :destroy

  map.resources :projects, :has_many => :photos
  map.resources :photos, :user_sessions
  map.resources :users, :member => {:activate => :get, :edit_password => :get, :update_password => :put}

  map.namespace :admin do |admin|
    admin.root :controller => 'projects'
    admin.resources :users, :photos, :categories, :regions, :active_scaffold => true
    admin.resources :projects, :active_scaffold => true, :member => {:check_spam => :get, :confirm_spam => :put}
  end

  map.resource :about, :controller => "about"

  map.root :controller => "projects"
end

# RealSolutions::Application.routes do
#   match '/login' => "user_sessions#new"
#   match '/logout' => "user_sessions#destroy"

#   map.resource :user_session

#   resources :projects, :has_many => :photos
#   resources :photos, :user_sessions
#   resources :users, :member => {:activate => :get, :edit_password => :get, :update_password => :put}

#   namespace :admin do
#     root :to => 'projects'
#     resources :users, :photos, :categories, :regions, :active_scaffold => true
#     resources :projects, :active_scaffold => true, :member => {:check_spam => :get, :confirm_spam => :put}
#   end

#   resource :about, :controller => "about"

#   root :to => "projects"
# end
