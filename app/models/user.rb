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
#

class User < ActiveRecord::Base
  has_many :authorizations
  has_and_belongs_to_many :meetups
  has_secure_password
  validates_presence_of :last_name,   :length =>  {:minimum => 3}
  validates_presence_of :first_name,  :length =>  {:minimum => 2}
  validates :email, :uniqueness => true

  def add_provider(auth_hash)
    unless authorizations.find_by_provider_and_uid(auth_hash['provider'], auth_hash['uid'])
      Authorization.create :user => self, :provider => auth_hash['provider'], :uid => auth_hash['uid']
    end
  end

end
