class Tweet < ActiveRecord::Base
  belongs_to :subject
  validates :subject_id, presence: true
  validates :text, presence: true
  validates :tweet_id, presence: true
end