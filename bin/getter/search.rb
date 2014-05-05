
APP_PATH = File.expand_path('../../../config/application',  __FILE__)
require File.expand_path('../../../config/boot',  __FILE__)
require APP_PATH
require 'date'
Rails.application.require_environment!


require 'rubygems'
require_relative './instagram.rb'

require 'pp'

instagram = InstagramGet.new

profiles = instagram.search(ARGV[0]);

puts "================="
profiles.each do |profile|
  puts "#{profile.username}: #{profile.id}"
end


# api.instagram.com/v1/users/search.json?q=rodmaykel&client_id=XX