require 'spec_helper'
require 'helpers/sessions_helper_spec'
include SessionsHelperSpec

describe 'Events' do
  let(:user)      {FactoryGirl.create :user}
  let!(:event1)    {FactoryGirl.create :event1}
  let!(:event2)    {FactoryGirl.create :event2}

  before :each do
    visit root_path
    click_link 'Log In'
    login user
    click_link 'Find Events'
  end

  describe 'GET /events' do
    it 'should go to the sporting events page' do
      page.should have_text 'Events'
    end
    it 'should list the sporting events available' do
      within :css, '.events' do
        page.should have_css '.event'
      end
    end

  end

end