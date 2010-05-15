
class User < ActiveRecord::Base
  acts_as_authentic
  
  attr_protected :is_admin
  after_create :send_notification_email
  
  def name
    email.split('@').first.titleize
  end
  
  def send_notification_email
    Notifier.deliver_new_user_created(self)
  end
end


# == Schema Information
#
# Table name: users
#
#  id                :integer(4)      not null, primary key
#  created_at        :datetime
#  updated_at        :datetime
#  email             :string(255)     not null
#  crypted_password  :string(255)     not null
#  password_salt     :string(255)     not null
#  persistence_token :string(255)     not null
#  login_count       :integer(4)      default(0), not null
#  last_request_at   :datetime
#  last_login_at     :datetime
#  current_login_at  :datetime
#  last_login_ip     :string(255)
#  current_login_ip  :string(255)
#  is_admin          :boolean(1)      default(FALSE)
#

