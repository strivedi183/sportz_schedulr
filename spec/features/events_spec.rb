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
    it 'should go to the sporting events index page' do
      page.should have_text 'Events'
    end
    it 'should list the sporting events available' do
      within :css, '.events' do
        page.should have_css '.event'
        page.should have_css '.name'
        page.should have_css '.date'
        page.should have_css '.venue'
      end
    end
  end

  describe 'GET /events/:id' do
    it "should go to the sporting event's show page" do
      within :css, '.events' do
        first(:link).click
      end
      page.should have_text event1.name
      page.should have_text event1.description
      page.should_not have_text event2.name
    end
  end

end