module Admin
  class PhotosController < ApplicationController
    layout "admin"
    active_scaffold :photos
  
  end
end