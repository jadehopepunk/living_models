class Project < ActiveRecord::Base
  REGIONS = ["North Island", "South Island"]
  
  acts_as_taggable_on :tags

  validates_presence_of :name, :location, :region, :category_id, :summary, :contact_email_address
  validates_length_of :name, :location, :website, :contact_email_address, :contact_name, :contact_phone, :maximum => 255, :allow_nil => true
  
  has_many :photos
  belongs_to :category
  
  named_scope :published, :conditions => {:published => true}
  
  named_scope :for_categories, lambda {|category_ids|
    if category_ids.empty?
      {}
    else
      {:conditions => "category_id IN (#{category_ids.map(&:to_i).join(',')})"}
    end
  }
  
  delegate :name, :to => :category, :prefix => :category, :allow_nil => true
  
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
#  existing_tag_string   :string(255)
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
#  region                :string(255)
#

