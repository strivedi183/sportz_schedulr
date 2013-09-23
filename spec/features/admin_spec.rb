require 'spec_helper'

describe '/admin' do
  let(:admin) {FactoryGirl.create(:admin)}
  before(:each) do
    visit root_path
    click_link 'Admin'
  end

  it 'accesses the login page' do
    within 'h1' do
      page.should have_content 'Administration'
    end
  end
  it 'has a log in form' do
    within 'form' do
      page.should have_content 'Log In'
      page.should have_content 'Email'
      page.should have_content 'Password'
    end
  end
  # it 'logs an admin into the system' do
  #   fill_in :email,     :with => admin.email
  #   fill_in :password,  :with => admin.password
  #   click_button 'Log In'
  #   page.should redirect_to admin_path if admin.is_admin
  # end
end