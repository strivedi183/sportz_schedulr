# == Schema Information
#
# Table name: friends
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  email       :string(255)
#  facebook_id :string(255)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Friend do
  let(:friend) {FactoryGirl.create(:friend) }
  let(:user)   {FactoryGirl.create(:user)}
  describe '.new' do
    it 'should create a Friend instance' do
      expect(friend).to be_an_instance_of Friend
    end
  end
  describe '.create' do
    it 'should create a Friend in the database' do
      expect(friend.id).to_not be_nil
    end
  end
  describe '#name' do
    it 'should have a name' do
      expect(friend.name).to eq 'Friend Frienderson'
    end
  end
  describe '#email' do
    it 'should have an email' do
      expect(friend.email).to eq 'friend@testfriends.com'
    end
  end
  describe '#facebook_id' do
    it 'should have a facebook id' do
      expect(friend).to be_valid
      expect(friend.facebook_id).to eq '1234567890'
    end
    it 'requires a facebook id' do
      friend.facebook_id = ''
      friend.save
      expect(friend).to_not be_valid
    end
  end
  describe '#user' do
    it 'should have a user' do
      friend.update_attribute 'user', user
      expect(friend.user).to be_an_instance_of User
    end
  end
end
