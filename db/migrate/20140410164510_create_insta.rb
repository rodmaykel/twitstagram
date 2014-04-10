class CreateInsta < ActiveRecord::Migration
  def change
    create_table :insta do |t|
      t.integer :subject_id
      t.datetime :created
      t.string :photo
      t.string :caption

      t.timestamps
    end
  end
end
