class UsersController < ApplicationController
  layout "admin"
  active_scaffold :user do |config|
    config.columns = [:email, :created_at, :last_login_at]
  end
  
end
