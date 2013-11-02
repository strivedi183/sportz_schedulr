class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  # authorizes with Facebook and oauth instead
  def create_with_facebook
    auth_hash     = request.env['omniauth.auth']
    authorization = Authorization.find_by_provider_and_uid(auth_hash['provider'], auth_hash['uid'])
    name          = auth_hash['info']['name'].split
    email         = auth_hash['info']['email']
    first, last   = name[0], name[1..-1].join(' ')
    user          = User.find_by_first_name_and_last_name_and_email(first, last, email)

    # when both a user and an authorization have been found
    if authorization && user
      user.oauth_token = auth_hash['credentials']['token']
      user.save
      sessionize authorization.user

    # if only a user exists, build an authorization
    elsif user
      user.authorizations.build :provider => auth_hash['provider'], :uid => auth_hash['uid']
      sessionize user

    # No user or authorization; build them
    else
      user = User.new(:first_name => first, :last_name => last, :email => email)
      user.authorizations.build :provider => auth_hash['provider'], :uid => auth_hash['uid']
      user.save
      sessionize user
    end

    redirect_to root_path
  end

  def create
    user = User.where(:email => params[:email]).first
    if user && user.authenticate(params[:password])
      sessionize user
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

  private
  def sessionize(user)
    @auth = user
    session[:user_id] = user.id
  end


end