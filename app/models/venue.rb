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
#  address     :string(255)
#
class Venue < ActiveRecord::Base
  has_many            :events
  has_many            :meetups
  geocoded_by         :address
  reverse_geocoded_by :lat, :lng,       :if => lambda { |obj| obj.address_changed? }
  after_validation    :geocode,         :if => lambda {|obj| obj.lat.nil? || obj.lng.nil? }
  after_validation    :reverse_geocode
end
