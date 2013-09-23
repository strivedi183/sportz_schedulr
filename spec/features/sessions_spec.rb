require 'spec_helper'

describe 'sessions' do
  let(:user)  {FactoryGirl.create(:user)}
  let(:admin) {FactoryGirl.create(:admin)}

  before(:each) do
    visit root_path
    click_link 'Log In'
  end

  it 'should go to the login page' do
    within 'h1' do
      page.should have_text 'Log In'
    end
  end

  it 'should have a login form' do
    within 'form' do
      page.should have_text :email
      page.should have_text :password
      page.should have_button 'Log In'
    end
  end

  it 'should redirect a user to the login page after UNSUCCESSFUL login attempt' do
    fill_in :email,    :with => user.email
    fill_in :password, :with => 'blobby'
    click_button 'Log In'
    page.should have_text "Incorrect Email and/or Password"
  end

  it 'should redirect a user to the root page after a SUCCESSFUL login attempt' do
    fill_in :email,     :with => user.email
    fill_in :password,  :with => user.password
    click_button 'Log In'
    page.should have_text 'Home'
  end

  it 'should redirect the admin to the dashboard page after a SUCCESSFUL login attempt' do
    fill_in :email,     :with => admin.email
    fill_in :password,  :with => admin.password
    click_button 'Log In'
    page.should have_text 'Dashboard'
  end

  it 'should redirect the visitor to the login page if he/she isn\'t logged in' do
    if @auth.nil?
      page.should have_text 'SPORTZ SCHEDULR -- Home'
    end
  end

  it 'should destroy a session when the user logs out' do
    fill_in :email,       :with => user.email
    fill_in :password,    :with => user.password
    click_button 'Log In'
    click_link 'Logout'
    page.should have_text 'Login'
  end



end