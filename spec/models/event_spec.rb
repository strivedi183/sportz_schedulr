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

require 'spec_helper'

describe Event do
  let(:event) {FactoryGirl.create(:event1)}
  describe '.new' do
    it 'creates an Event instance' do
      expect(event).to be_an_instance_of Event
    end
  end
  describe '.create' do
    it 'saves an Event instance to the database' do
      expect(event.id).to_not be nil
    end
  end
  describe '#name' do
    it 'has a name' do
      expect(event.name).to be_an_instance_of String
      expect(event.name).to eq 'Denver Broncos at New York Giants'
    end
  end
  describe '#description' do
    it 'has a description' do
      expect(event.description).to be_an_instance_of String
      expect(event.description).to eq 'Week 2 of the NFL is here! The Giants play the Broncos in the third Manning Bowl!'
    end
  end
  describe '#date' do
    it 'has a date' do
      expect(event.date).to be_an_instance_of ActiveSupport::TimeWithZone
      expect(event.date.month).to eq 9
      expect(event.date.day).to eq 15
      expect(event.date.year).to eq 2013
    end
  end
end
