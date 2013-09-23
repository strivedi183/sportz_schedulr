# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

require 'spec_helper'


describe User do
  let(:user) {FactoryGirl.create(:user)}
  describe '.new' do
    it 'creates a new User instance' do
      expect(user).to be_an_instance_of User
    end
  end
  describe '.create' do
    it 'saves a User instance in the db' do
      expect(user.id).to_not be nil
    end
  end
  describe 'instance variables' do
    it 'has a first name' do
      expect(user.first_name).to eq 'Testie'
    end
    it 'has a last name' do
      expect(user.last_name).to eq 'Testerson'
    end
    it 'has an email' do
      expect(user.email).to eq 'test@test.com'
    end
  end

end
