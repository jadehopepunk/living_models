class Notifier < ActionMailer::Base
  NO_REPLY_ADDRESS = "noreply@realsolutions.org.nz"
  SUBJECT_PREFIX = "[Bank of Real Solutions]"
  ADMIN_ADDRESSES = ["laurenceboomert@xtra.co.nz"]
  
  def pending_project_added(project)
    subject    "#{SUBJECT_PREFIX} New story added"
    from       NO_REPLY_ADDRESS
    recipients ADMIN_ADDRESSES
    body       :project => project    
  end

end
