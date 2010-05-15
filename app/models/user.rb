
class User < ActiveRecord::Base
  acts_as_authentic do |config|
    config.disable_perishable_token_maintenance true
    config.merge_validates_length_of_password_field_options :allow_nil => true
    config.merge_validates_confirmation_of_password_field_options :allow_nil => true
    config.merge_validates_length_of_password_confirmation_field_options :allow_nil => true
    config.ignore_blank_passwords true
  end
    
  attr_protected :is_admin
  after_create :send_notification_email
  before_validation_on_create :activate_if_admin
  
  def name
    email.split('@').first.titleize
  end
  
  def send_notification_email
    reset_perishable_token!
    Notifier.deliver_new_user_created(self)
  end

  def has_password?
    !crypted_password.blank?
  end
  
  def activate!
    self.activated = true
    save!
  end  
  
  protected
  
    def activate_if_admin
      self.activated = true if is_admin
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

