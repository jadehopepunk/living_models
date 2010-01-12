module Admin
  class UsersController < ApplicationController
    layout "admin"
    active_scaffold :user do |config|
      config.columns = [:email, :created_at, :last_login_at, :password]
      list.columns = [:email, :created_at, :last_login_at]
      update.columns.exclude :last_login_at
      create.columns.exclude :last_login_at
    end
  
  end
end