
APP_PATH = File.expand_path('../../../config/application',  __FILE__)
require File.expand_path('../../../config/boot',  __FILE__)
require APP_PATH
Rails.application.require_environment!


require 'rubygems'
require_relative './twitter.rb'
require_relative './instagram.rb'

require 'pp'

def insert_tweet (tweet) 
  pp tweet.text
end


def insert_instagram (photo)
  pp photo.images # standard_resolution, low_resolution, thumbnail
end


puts "==== START SCRIPT ===="
twitter = TwitterGet.new
instagram = InstagramGet.new

Subject.all().each do |subject| # TODO
  
  # Get+insert Twitter
  puts "===Twitter: " + subject['twitter']  
  twitter.get_tweets(subject['twitter']).each do |tweet|
    insert_tweet(tweet)
  end

  # Get+insert Instagram
  puts "===Instagram: " + subject['instagram']
  instagram.get_photos(subject['instagram']).each do |photo|
    insert_instagram(photo)
  end

  puts "====================="
end
puts "==== END SCRIPT ===="



