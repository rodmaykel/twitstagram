require 'twitter'


class TwitterGet
  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token        = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_SECRET']
    end

  end

  def get_tweets(username)
    return @client.user_timeline(username)
  end

end



if __FILE__ == $0
  account = TwitterGet.new('michael');
  puts account.get_tweets
end