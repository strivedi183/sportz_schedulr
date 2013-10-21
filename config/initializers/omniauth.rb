Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, FACEBOOK_SPORTZ_ID, FACEBOOK_SPORTZ_SEC
end

# OmniAuth.config.test_mode = true
# OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
#   :provider => 'facebook',
#   :uid      => '1234',
#   :info     => {
#             :name   => 'Test Testerson',
#             :email  => 'test@test.com'
#           },
#           :credentials => {:token => 'token-facebook'}
#   })