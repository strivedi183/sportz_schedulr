class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  # authorizes with Facebook and oauth instead
  def create_with_facebook
    auth_hash = request.env['omniauth.auth']
    @authorization = Authorization.find_by_provider_and_uid(auth_hash['provider'], auth_hash['uid'])
    if @authorization
      render :text => "Welcome back #{@authorization.user.name}!"
    else
      user = User.new :first_name => auth_hash['info']['name'], :email => auth_hash['info']['email']
      user.authorizations.build :provider => auth_hash['provider'], :uid => auth_hash['uid']
      user.save
      render :text => "Hi #{user.first_name}! You've signed up."
    end
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