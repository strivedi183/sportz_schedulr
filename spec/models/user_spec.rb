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

require 'spec_helper'


describe User do
  let(:user)      {FactoryGirl.create(:user)}
  let(:admin)     {FactoryGirl.create(:admin)}

  describe '.new' do
    it 'creates a new User instance' do
      expect(user).to be_an_instance_of User
    end
  end

  describe '.create' do
    it 'saves a User instance in the db' do
      expect(user.id).to_not be nil
    end
  end

  describe 'instance variables' do
    it 'has a first name' do
      expect(user.first_name).to_not be nil
      expect(user.first_name).to eq 'Testie'
    end
    it 'has a last name' do
      expect(user.last_name).to eq 'Testerson'
    end
    it 'has an email' do
      expect(user.email).to eq 'test@test.com'
    end
    it 'is not an administrator' do
      expect(user.is_admin).to eq false
    end
    it 'is an administrator ' do
      expect(admin.is_admin).to eq true
    end
  end

  describe 'validations' do
    let(:nil_user) { User.new }
    it 'requires a last name' do
      nil_user.last_name = ''
      expect(nil_user).to_not be_valid
    end

    it 'requires a first name' do
      expect(nil_user).to_not be_valid
    end
    it 'requires an email' do
      expect(nil_user).to_not be_valid
    end
    it 'requires a password' do
      expect(nil_user).to_not be_valid
    end
  end

  describe '#facebook' do
    it 'connects to the Facebook API' do
    #   stub_request(:all, 'https://graph.facebook.com/oauth/access_token')
    #       .with(:body => {
    #               'client_id'     => ENV['FACEBOOK_SPORTZ_ID'],
    #               'client_secret' => ENV['FACEBOOK_SPORTZ_SEC'],
    #               'type'          => 'client_cred'
    #               },
    #             :headers => {'Accept'           =>'*/*',
    #                          'Accept-Encoding'  =>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
    #                          'Content-Type'     =>'application/x-www-form-urlencoded',
    #                          'User-Agent'       =>'Faraday v0.8.8'
    #                         }
    #             )
    #       .to_return(:status=>200, :body=>'', :headers=>{})

    #   uri = URI 'https://graph.facebook.com/oauth/access_token'
    #   req = Net::HTTP::new(uri)
    #   req.use_ssl = true
    #   req.verify_mode = OpenSSL::SSL::VERIFY_NONE
    #   # req['Accept']           = '*/*',
    #   # req['Accept-Encoding']  = 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3'
    #   # req['Content-Type']     = 'application/x-www-form-urlencoded'
    #   # req['User-Agent']       = 'Faraday v0.8.8'

    #   Net::HTTP.start(uri.host, uri.port) do |http|
    #     # http.use_ssl = true
    #     # http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    #     http.request(req, 'abc')
    #   end

    #   WebMock.should have_requested(:get, 'https://graph.facebook.com/oauth/access_token')
    #                     .with(:body=>'abc', :headers => {
    #                                         'Accept'           =>'*/*',
    #                                         'Accept-Encoding'  =>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
    #                                         'Content-Type'     =>'application/x-www-form-urlencoded',
    #                                         'User-Agent'       =>'Faraday v0.8.8'
    #                         }).once

    #   # @test_users = Koala::Facebook::TestUsers.new(:app_id => FACEBOOK_SPORTZ_ID, :secret => FACEBOOK_SPORTZ_SEC)
    #   # user = @test_users.create true
    #   # user_graph_api = Koala::Facebook::API.new user['access_token']
    #   # expect(user).to_not be nil
    # end
  end


end
