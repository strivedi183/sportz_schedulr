class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.where(:email => params[:email]).first
    if user && user.authenticate(params[:password])
      redirect_to admin_path if user.is_admin
      redirect_to root_path
    else
      flash.alert = "Incorrect Email and/or Password"
      render :new
    end
  end


end