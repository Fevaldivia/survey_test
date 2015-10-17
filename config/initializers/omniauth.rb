Rails.application.config.middleware.use OmniAuth::Builder do
  provider  :facebook,
            ENV['1493795334248559'], ENV['853eac761c67c522b0e0de5d26da0ec9'],
            scope: 'public_profile', display: 'page', image_size: 'square'
end
