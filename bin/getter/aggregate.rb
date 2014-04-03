require 'rubygems'
require 'mongo'
require_relative './twitter.rb'

DBNAME = 'twitstagram'
host = 'localhost'
port = Mongo::MongoClient::DEFAULT_PORT

client = Mongo::MongoClient.new(host, port)
db = client.db(DBNAME)
personsColl = db.collection('persons')
tweetsColl = db.collection('tweets')
instagramsColl = db.collection('instagrams')

puts "==== START SCRIPT ===="

personsColl.find().each do |person|
    
  # Get+insert Twitter
  twitter = Twitter.new(person['twitter'])
  puts twitter.get_tweets.join(', ');

  # Get+insert Instagram
  # puts person['instagram']


  puts "====================="
end


