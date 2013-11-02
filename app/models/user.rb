# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  is_admin        :boolean          default(FALSE)
#  lat             :float
#  lng             :float
#

class User < ActiveRecord::Base
  has_many :authorizations, :friends
  has_and_belongs_to_many :meetups
  has_secure_password   :validations => false, :if => :authorizations
  validates_presence_of :last_name,   :length =>  {:minimum => 3}
  validates_presence_of :first_name,  :length =>  {:minimum => 2}
  validates             :email, :uniqueness => true


  def add_provider(auth_hash)
    unless authorizations.find_by_provider_and_uid(auth_hash['provider'], auth_hash['uid'])
      Authorization.create :user => self, :provider => auth_hash['provider'], :uid => auth_hash['uid']
    end
  end


  # for interacting with the Facebook API
  def facebook
    @facebook ||= Koala::Facebook::API.new oauth_token
  end

  def friends
    self.facebook.get_connection('me', 'friends')
  end

  def friends_count
    self.facebook.get_connection('me', 'friends').size
  end



  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider         = auth.provider
      user.uid              = auth.uid
      user.name             = auth.info.name
      user.oauth_token      = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
