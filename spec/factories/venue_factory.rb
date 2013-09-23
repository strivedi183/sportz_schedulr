# == Schema Information
#
# Table name: venues
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  lat         :float
#  lng         :float
#  created_at  :datetime
#  updated_at  :datetime
#

FactoryGirl.define do
  factory :venue, :class => Venue do
    name                'MetLife Stadium'
    description         'The place where the Giants and Jets play.'
    lat                 40.813611
    lng                 -74.074444
  end
end
