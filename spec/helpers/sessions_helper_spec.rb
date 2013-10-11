require 'spec_helper'

module SessionsHelperSpec
  def login(user)
    fill_in       'email',    :with => user.email
    fill_in       'password', :with => user.password
    click_button  'Log In'
  end
end