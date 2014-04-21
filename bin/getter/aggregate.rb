
APP_PATH = File.expand_path('../../../config/application',  __FILE__)
require File.expand_path('../../../config/boot',  __FILE__)
require APP_PATH
require 'date'
Rails.application.require_environment!


require 'rubygems'
require_relative './twitter.rb'
require_relative './instagram.rb'

require 'pp'

def insert_tweet (subject,tweet) 
  puts tweet.id
  puts tweet.text
  puts tweet.created_at
  created_at = tweet.created_at
  begin
    subject.tweets.create!(tweet_id: tweet.id, text: tweet.text, created: created_at)
  rescue 
    # do nothing
  end
end


def insert_instagram (subject,photo)
  if photo.type == "image" then
    #pp photo
    puts photo.images.standard_resolution.url
    puts photo.created_time
    if !photo.caption.nil? then
      puts photo.caption.text
    end
    puts photo.id

    caption = ''
    if !photo.caption.nil? then
      caption = photo.caption.text
    end
    created_at = DateTime.strptime(photo.created_time,'%s')
    begin
      subject.photos.create!(instagram_id: photo.id, caption: caption, photo: photo.images.standard_resolution.url, created: created_at)
    rescue
      # do nothing
    end
  end

end


puts "==== START SCRIPT ===="
twitter = TwitterGet.new
instagram = InstagramGet.new

Subject.all().each do |subject| # TODO
  puts "==== " + subject['twitter'] + " ===="

  # Get+insert Twitter
  puts "===Twitter: " + subject['twitter']  
  twitter.get_tweets(subject['twitter']).each do |tweet|
    insert_tweet(subject, tweet)
  end

  # Get+insert Instagram
  puts "===Instagram: " + subject['instagram']
  instagram.get_photos(subject['instagram']).each do |photo|
    insert_instagram(subject, photo)
  end

end
puts "==== END SCRIPT ===="



#TODO: Improve efficiency by having a marker of last update instead of catching create error

