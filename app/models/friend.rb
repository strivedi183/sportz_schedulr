# == Schema Information
#
# Table name: friends
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  email       :string(255)
#  facebook_id :string(255)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Friend < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :facebook_id
end
