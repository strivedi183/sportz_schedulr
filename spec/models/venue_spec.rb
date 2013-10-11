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

require 'spec_helper'

describe Venue do
  let(:venue) {FactoryGirl.create(:venue)}
  describe '.new' do
    it 'should create a Venue instance' do
      expect(venue).to be_an_instance_of Venue
    end
  end
  describe '.create' do
    it 'should be able to be saved in the database' do
      expect(venue.id).to_not be nil
    end
  end
  describe 'instance variables' do
    describe '#name' do
      it 'should have a name' do
        expect(venue.name).to be_an_instance_of String
        expect(venue.name).to eq "MetLife Stadium"
      end
    end
    describe '#description' do
      it 'should have a description' do
        expect(venue.description).to be_an_instance_of String
        expect(venue.description).to eq 'The place where the Giants and Jets play.'
      end
    end
    describe 'address' do
      it 'should have an address' do
        expect(venue.address).to be_an_instance_of String
      end
    end
    describe 'coords' do
      it 'should have a latitude coordinate' do
        expect(venue.lat).to be_an_instance_of Float
        expect(venue.lat).to eq 40.813611
      end
      it 'should have a longitude coordinate' do
        expect(venue.lng).to be_an_instance_of Float
        expect(venue.lng).to eq -74.074444
      end
    end
  end
end
