# == Schema Information
#
# Table name: meetups
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  start_date :datetime
#  end_date   :datetime
#  user_id    :integer
#  event_id   :integer
#  venue_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Meetup < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_one :event
  belongs_to :venue
end
