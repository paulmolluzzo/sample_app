# == Schema Information
# Schema version: 20110427190926
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  attr_accessible :name, :email
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates_presence_of :name
  validates_length_of :name, :maximum =>50
  validates_presence_of :email
  validates_format_of :email, { :with => email_regex }
  validates_uniqueness_of :email, { :case_sensitive => false }
end
