class AddIndexToPhotos < ActiveRecord::Migration
  def change
    add_index :photos, :subject_id
    add_index :photos, :instagram_id
  end
end
