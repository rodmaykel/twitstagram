class Subject < ActiveRecord::Base
  has_many :tweets
  has_many :insta
end
