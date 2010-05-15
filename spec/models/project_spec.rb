require 'spec_helper'

describe Project do
  describe "when creating" do
    before :each do
      @project = Project.make_unsaved
    end

    describe "if user already exists for that email address" do
      before :each do
        @user = User.make(:email => 'bilbo@baggins.com')
      end

      it "should set that user as the owner" do
        @project.contact_email_address = 'bilbo@baggins.com'
        @project.save
        @project.owner.should == @user
      end
    end

    describe "if user doesnt exist for that email address" do
      it "should create the owner" do
        @project.contact_email_address = 'bilbo@baggins.com'
        @project.save
        @project.owner.should be_a(User)
        @project.owner.email == 'bilbo@baggins.com'
      end
    end
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

