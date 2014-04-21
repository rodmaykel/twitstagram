class AddIndexToTweets < ActiveRecord::Migration
  def change
    add_index :tweets, :subject_id
    add_index :tweets, :tweet_id
  end
end
