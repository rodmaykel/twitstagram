require 'rubygems'
require 'mongo'
require_relative './twitter.rb'
require_relative './instagram.rb'

require 'pp'

DBNAME = 'twitstagram'
host = 'localhost'
port = Mongo::MongoClient::DEFAULT_PORT

client = Mongo::MongoClient.new(host, port)
db = client.db(DBNAME)
personsColl = db.collection('persons')
tweetsColl = db.collection('tweets')
instagramsColl = db.collection('instagrams')

puts "==== START SCRIPT ===="
twitter = TwitterGet.new
instagram = InstagramGet.new

personsColl.find().each do |person|
  
  # Get+insert Twitter
  puts "===Twitter: " + person['twitter']  
  twitter.get_tweets(person['twitter']).each do |tweet|
    pp tweet
  end

  # Get+insert Instagram
  puts "===Instagram: " + person['instagram']
  instagram.get_photos(person['instagram']).each do |photo|
    pp photo
  end

  puts "====================="
end


def insert_tweet 

end


def insert_instagram

end
