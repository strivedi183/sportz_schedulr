class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.where(:email => params[:email]).first
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      @auth = User.find(session[:user_id])
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

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end