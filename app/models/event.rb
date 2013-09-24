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
class Event < ActiveRecord::Base
end
