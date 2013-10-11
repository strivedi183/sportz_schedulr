# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  date        :datetime
#  created_at  :datetime
#  updated_at  :datetime
#  venue_id    :integer
#

FactoryGirl.define do
  factory :event1, :class => Event do
    name              'Denver Broncos at New York Giants'
    description       'Week 2 of the NFL is here! The Giants play the Broncos in the third Manning Bowl!'
    date              Date.new 2013,9,15
  end
  factory :event2, :class => Event do
    name              'New York Giants at Chicago Bears'
    description       'Week 6. Watch the Giants lose again and again!'
    date              Date.new 2013,10,11
  end
end
