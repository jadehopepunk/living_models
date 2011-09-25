module Admin
  class AdminController < ApplicationController
    layout "admin"
    before_filter :require_admin

    ActiveScaffold.set_defaults do |config| 
      config.ignore_columns.add [:created_at, :updated_at, :lock_version, :versions]
    end
  end
end