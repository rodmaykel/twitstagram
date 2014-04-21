class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :subject_id
      t.string :caption
      t.datetime :created
      t.string :photo
      t.string :instagram_id

      t.timestamps
    end
  end
end
