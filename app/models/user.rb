# == Schema Information
# Schema version: 20110429024249
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#

class User < ActiveRecord::Base
  attr_accessor   :password
  attr_accessible :name, :email, :password, :password_confirmation
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates_presence_of :name
  validates_length_of :name, :maximum =>50
  validates_presence_of :email
  validates_format_of :email, { :with => email_regex }
  validates_uniqueness_of :email, { :case_sensitive => false }
  validates_presence_of :password
  validates_confirmation_of :password
  validates_length_of :password, :within =>6..40
  
end
