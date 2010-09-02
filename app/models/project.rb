class Project < ActiveRecord::Base
  REGIONS = ["North Island", "South Island"]

  acts_as_taggable_on :tags

  validates_presence_of :name, :location, :region, :category_id, :summary, :contact_email_address
  validates_length_of :name, :location, :website, :contact_email_address, :contact_name, :contact_phone, :maximum => 255, :allow_nil => true

  has_many :photos
  belongs_to :category
  belongs_to :owner, :class_name => "User"

  named_scope :published, :conditions => {:published => true}

  named_scope :for_categories, lambda {|category_ids|
    if category_ids.empty?
      {}
    else
      {:conditions => "category_id IN (#{category_ids.map(&:to_i).join(',')})"}
    end
  }

  named_scope :for_regions, lambda {|region_names|
    if region_names.empty?
      {}
    else
      quoted_names = region_names.map {|name| ActiveRecord::Base.connection.quote(name)}
      {:conditions => "region IN (#{quoted_names.join(',')})"}
    end
  }

  delegate :name, :to => :category, :prefix => :category, :allow_nil => true

  before_validation_on_create :setup_owner
  after_create :notify_admin_of_pending_project

  def feature_photo
    photos.first
  end
  
  def can_be_edited_by?(current_user)
    current_user && (current_user.is_admin? || current_user == owner)
  end
  
  def new_file=(value)
    photos << Photo.new(:file => value) if value
  end

  protected

    def notify_admin_of_pending_project
      unless published
        Notifier.deliver_pending_project_added(self)
      end
    rescue => e
      HoptoadNotifier.notify(e)
    end

    def setup_owner
      self.owner = User.find_or_create_by_email(contact_email_address)
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

