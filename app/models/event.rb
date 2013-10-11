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

class Event < ActiveRecord::Base
  belongs_to  :venue

  def venue_name
    self.venue.name if self.venue.present?
  end
  def venue_address
    self.venue.address if self.venue.present?
  end
end
