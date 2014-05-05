require 'instagram'

Instagram.configure do |config|
  config.client_id = ENV['INSTAGRAM_CLIENT_ID']
  config.client_secret = ENV['INSTAGRAM_CLIENT_SECRET']
  #config.access_token = ENV['INSTAGRAM_ACCESS_TOKEN']
end

class InstagramGet
  def initialize
    @client = Instagram.client()
  end

  def get_photos(id)
    return @client.user_recent_media(id)
  end

  def search(query)
    return @client.user_search(query)
  end

end

