class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :twitter
      t.string :instagram
      t.string :name
      t.string :photo_url

      t.timestamps
    end
  end
end
