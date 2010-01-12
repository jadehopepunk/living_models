module Admin
  class UsersController < AdminController
    active_scaffold :user do |config|
      config.columns = [:email, :is_admin, :created_at, :last_login_at, :password]
      list.columns = [:email, :is_admin, :created_at, :last_login_at]
      create.columns = [:email, :is_admin, :password, :password_confirmation]
      update.columns = [:email, :is_admin, :password, :password_confirmation]
    end
  
  end
end