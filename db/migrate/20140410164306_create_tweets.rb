class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :subject_id
      t.string :tweet
      t.datetime :created
      t.string :photo

      t.timestamps
    end
  end
end
