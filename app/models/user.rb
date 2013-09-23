# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  is_admin        :boolean
#

class User < ActiveRecord::Base
  has_and_belongs_to_many :meetups
  has_secure_password
  validates_presence_of :last_name,   :length => {:minimum => 3}
  validates_presence_of :first_name,  :length => {:minimum => 2}
end
