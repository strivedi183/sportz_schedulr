class Api::UsersController < ApplicationController
  respond_to :json

  def index
    all_users = User.all
    users = []
    all_users.each do |user|
      users <<  { :first_name  => user.first_name,
                  :last_name   => user.last_name,
                  :email       => user.email,
                  :id          => user.id
                }
    end
    respond_with users.to_json
  end
end