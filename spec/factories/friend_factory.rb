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

FactoryGirl.define do
  factory :friend, :class => Friend do
    name        'Friend Frienderson'
    email       'friend@testfriends.com'
    facebook_id '1234567890'
  end
end
