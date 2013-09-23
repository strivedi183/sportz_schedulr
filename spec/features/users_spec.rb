require 'spec_helper'
require 'helpers/users_helper_spec'
include UsersHelperSpec

describe 'Users' do
  let(:user) {FactoryGirl.create(:user)}
  before(:each) do
    visit root_path
    click_link 'Register'
  end
  describe 'GET /users/new' do
    it 'displays the new user -- registration -- page' do
      within 'h1' do
        page.should have_text 'Register'
      end
    end

    it 'creates a new user' do
      within 'form' do
        register user
      end
      expect(page).to have_text 'SPORTZ SCHEDULR -- Home'
    end

    it 'prevents duplicate entries by email' do
      within 'form' do
        register user
        register user
      end
      expect(page).to have_text 'Error: Did Not Save Registration'
    end

  end
end