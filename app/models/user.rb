class User < ActiveRecord::Base
  acts_as_authentic
  
  def name
    email.split('@').first.titleize
  end
end
