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
end
