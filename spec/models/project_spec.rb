require 'spec_helper'

describe Project do
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    Project.create!(@valid_attributes)
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

