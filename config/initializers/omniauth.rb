Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '379218275557631', 'da20c869f513ba34b627a177ec305bde'
end