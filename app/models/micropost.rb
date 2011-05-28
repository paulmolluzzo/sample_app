# == Schema Information
# Schema version: 20110523020301
#
# Table name: microposts
#
#  id         :integer         not null, primary key
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Micropost < ActiveRecord::Base
  attr_accessible :content
  
  belongs_to :user
  
  validates_presence_of     :content
  validates_length_of       :content, :maximum =>140
  validates_presence_of     :user_id
  
  default_scope :order => 'microposts.created_at DESC'
  
  scope :from_users_followed_by, lambda { |user| followed_by(user) }
  
  private
  
  def self.followed_by(user)
    followed_ids = %(SELECT followed_id FROM relationships 
                      WHERE follower_id = :user_id)
    where("user_id IN (#{followed_ids})OR user_id = :user_id", 
          :user_id => user)
  end
end




