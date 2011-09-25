require 'spec_helper'

describe Notifier do
  describe "new_user_created" do
    before :each do
      @user = User.make
      @email = Notifier.create_new_user_created(@user)
    end

    it "should have the correct details" do
      @email.subject.should == "Welcome to the Bank of Real Solutions"
      @email.from.should == ["noreply@realsolutions.org.nz"]
      @email.to.should == [@user.email]
      expected = <<eos
Welcome to the Bank of Real Solutions,

Your account has been created. If you wish to return to the site and alter any of your details, you will need to use the following link to activate your account and choose a password:

http://realsolutions.org.nz/users/#{@user.perishable_token}/activate

If you have any trouble, please email Laurence (laurenceboomert@xtra.co.nz) for assistance.
eos
      @email.body.should == expected
    end
  end
end
