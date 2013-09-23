require 'spec_helper'

module UsersHelperSpec
  def register(user)
    fill_in :user_first_name,            :with => user.first_name
    fill_in :user_last_name,             :with => user.last_name
    fill_in :user_email,                 :with => user.email
    fill_in :user_password,              :with => user.password
    fill_in :user_password_confirmation, :with => user.password
    click_button 'Create User'
  end
end