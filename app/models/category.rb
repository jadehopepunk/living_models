# == Schema Information
#
# Table name: categories
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Category < ActiveRecord::Base
  has_many :projects, :dependent => :nullify
  
  validates_presence_of :name, :description
  validates_length_of :name, :maximum => 50, :allow_nil => true
  validates_length_of :description, :maximum => 255, :allow_nil => true
end

