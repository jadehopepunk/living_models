require 'spec_helper'

describe User do
  describe "when created" do
    it "should send notification email" do
      @user = User.make_unsaved
      Notifier.should_receive(:deliver_new_user_created).with(@user)
      @user.save!
    end

    it "should be activated if is admin" do
      @user = User.make_unsaved
      @user.is_admin = true
      @user.save!
      @user.activated?.should == true
    end

    it "should not be activated if is not admin" do
      @user = User.make_unsaved
      @user.save!
      @user.activated?.should == false
    end
  end
end
