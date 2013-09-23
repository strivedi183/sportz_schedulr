class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.where(:email => params[:email]).first
    if user && user.authenticate(params[:password])
      if user.is_admin
        redirect_to admin_path
      else
        redirect_to root_path
      end
    else
      flash.alert = "Incorrect Email and/or Password"
      redirect_to login_path
    end
  end


end