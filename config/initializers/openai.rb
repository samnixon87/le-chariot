OpenAI.configure do |config|
  config.access_token = ENV.fetch('SECRET_KEY')
end
