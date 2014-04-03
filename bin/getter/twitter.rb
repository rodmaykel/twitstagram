class Twitter
  def initialize (username)
    @username = username
  end

  def get_tweets
    return [1,2,3]
  end

end



if __FILE__ == $0
  account = Twitter.new('michael');
  puts account.get_tweets
end