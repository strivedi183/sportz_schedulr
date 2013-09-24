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


FactoryGirl.define do
  factory :meetup, :class => Meetup do
    title         'NYG vs. Den'
    start_date    DateTime.new 2013,9,30
    end_date      DateTime.new 2013,9,30
  end
end
