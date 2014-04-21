class AddUniqueIndexToTweetAndPhoto < ActiveRecord::Migration
  def change
    add_index :photos, [:subject_id, :instagram_id], :unique => true
    add_index :tweets, [:subject_id, :tweet_id], :unique => true
  end
end
