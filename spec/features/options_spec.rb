require 'spec_helper'

describe 'Options' do
  let(:user) {FactoryGirl.create(:user)}
  before(:each) do
    visit root_path
    click_link "Log In"
    fill_in :email,     :with => user.email
    fill_in :password,  :with => user.password
    click_button 'Log In'
  end
  describe "Main Options Menu" do

    it 'should list the Options Menu' do
      within 'h3' do
        page.should have_text 'Options'
      end
    end

    it 'should list available options' do
      within 'nav.options' do
        page.should have_text 'My Meetups'
        page.should have_text 'Create a Meetup'
        page.should have_text 'My Friends'
      end
    end
  end

end