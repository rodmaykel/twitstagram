class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :subject_id
      t.string :text
      t.datetime :created
      t.string :photo
      t.string :tweet_id

      t.timestamps
    end
  end
end
