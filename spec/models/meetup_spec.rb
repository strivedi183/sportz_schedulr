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

require 'spec_helper'

describe Meetup do
  let(:meetup)  {FactoryGirl.create(:meetup)}
  let(:event)   {FactoryGirl.create(:event)}
  let(:venue)   {FactoryGirl.create(:venue)}

  describe '.new' do
    it 'creates a new Meetup instance' do
      expect(meetup).to be_an_instance_of Meetup
    end
  end
  describe '.create' do
    it 'saves a new Meetup instance in the database' do
      expect(meetup.id).to_not eq nil
    end
  end
  describe '#event' do
    it 'has an event' do
      meetup.event = event
      expect(meetup.event).to be_an_instance_of Event
    end
  end
  describe '#venue' do
    it 'has a venue' do
      meetup.venue = venue
      expect(meetup.venue).to be_an_instance_of Venue
    end
  end
end
