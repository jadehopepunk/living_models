class Project < ActiveRecord::Base
  validates_presence_of :name, :location, :category_id, :summary, :contact_email_address
  validates_length_of :name, :location, :tags, :website, :contact_email_address, :contact_name, :contact_phone, :maximum => 255, :allow_nil => true
  
  has_many :photos
  belongs_to :category
  
  named_scope :published, :conditions => {:published => true}
  
  def feature_photo
    photos.first
  end
end


# == Schema Information
#
# Table name: projects
#
#  id                    :integer(4)      not null, primary key
#  location              :string(255)
#  tags                  :string(255)
#  summary               :text
#  goals                 :text
#  outcomes              :text
#  future_plans          :text
#  website               :string(255)
#  contact_email_address :string(255)
#  contact_name          :string(255)
#  contact_phone         :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#  name                  :string(255)
#  published             :boolean(1)      default(FALSE)
#  category_id           :integer(4)
#

