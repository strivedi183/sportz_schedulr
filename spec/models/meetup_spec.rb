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
  let(:meetup)  {FactoryGirl.create :meetup}
  let(:friend)  {FactoryGirl.create :friend}
  describe '.new' do
    it 'creates a new Meetup instance' do
      meetup = Meetup.new
      expect(meetup).to be_an_instance_of Meetup
    end
  end

  describe '.create' do
    it 'saves a meetup in the database' do
      expect(meetup.id).to_not be_nil
    end
  end

  describe '#friends' do
    it 'has many friends' do
      meetup.friends << friend
      expect(meetup.friends.first).to be_an_instance_of Friend
      expect(meetup.friends.first).to eq friend
    end
  end

end
