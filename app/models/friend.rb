class Friend < ActiveRecord::Base
  attr_accessible :name, :email, :facebook_id
  belongs_to :user
end