Rails.application.config.middleware.use OmniAuth::Builder do
  puts ENV['NOCRAP_TWITTER_CONSUMER_KEY'], ENV['NOCRAP_TWITTER_CONSUMER_SECRET']
  provider :twitter, ENV['NOCRAP_TWITTER_CONSUMER_KEY'], ENV['NOCRAP_TWITTER_CONSUMER_SECRET']
end
