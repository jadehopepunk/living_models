class Photo < ActiveRecord::Base
end

# == Schema Information
#
# Table name: photos
#
#  id                :integer(4)      not null, primary key
#  file_file_name    :string(255)
#  file_content_type :string(255)
#  file_file_size    :integer(4)
#  file_updated_at   :datetime
#  project_id        :integer(4)
#  created_at        :datetime
#  updated_at        :datetime
#

