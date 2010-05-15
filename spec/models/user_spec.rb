require 'spec_helper'

describe User do
  describe "when created" do
    it "should send notification email" do
      @user = User.make_unsaved
      Notifier.should_receive(:deliver_new_user_created).with(@user)
      @user.save!
    end
  end
end
