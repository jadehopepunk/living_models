class AllowNullPasswordForUsers < ActiveRecord::Migration
  def self.up
    change_column_null :users, :email, true
    change_column_null :users, :crypted_password, true
    change_column_null :users, :password_salt, true
    change_column_null :users, :persistence_token, true
    change_column_null :users, :login_count, true
  end

  def self.down
  end
end
