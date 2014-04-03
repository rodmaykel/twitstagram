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
twitter = TwitterGet.new

personsColl.find().each do |person|
  
  puts person['twitter']  
  # Get+insert Twitter
  twitter.get_tweets(person['twitter']).each do |tweet|
    tweet.each do |key, val|
      puts "#{key}: #{val}"
    end

  
  end

  # Get+insert Instagram
  # puts person['instagram']


  puts "====================="
end


