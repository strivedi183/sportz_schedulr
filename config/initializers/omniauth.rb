Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, FACEBOOK_SPORTZ_ID, FACEBOOK_SPORTZ_SEC
end