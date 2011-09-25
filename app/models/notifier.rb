class Notifier < ActionMailer::Base
  default_url_options[:host] = "realsolutions.org.nz"

  NO_REPLY_ADDRESS = "noreply@realsolutions.org.nz"
  SUBJECT_PREFIX = "[Bank of Real Solutions]"
  ADMIN_ADDRESSES = ["laurenceboomert@xtra.co.nz"]
  
  def pending_project_added(project)
    subject    "#{SUBJECT_PREFIX} New story added"
    from       NO_REPLY_ADDRESS
    recipients ADMIN_ADDRESSES
    body       :project => project    
  end

  def new_user_created(user)
    subject    "Welcome to the Bank of Real Solutions"
    from       NO_REPLY_ADDRESS
    recipients user.email
    body       :user => user
  end

end
