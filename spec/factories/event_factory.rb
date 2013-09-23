# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  lat         :float
#  lng         :float
#  date        :datetime
#  created_at  :datetime
#  updated_at  :datetime
#

FactoryGirl.define do
  factory :event, :class => Event do
    name              'Denver Broncos at New York Giants'
    description       'Week 2 of the NFL is here! The Giants play the Broncos in the third Manning Bowl!'
    lat               40.813611
    lng               -74.074444
    date              Date.new(2013,9,15)
  end
end
