class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.integer :group_id
      t.string :twitter
      t.string :instagram
      t.string :name
      t.string :photo

      t.timestamps
    end
    add_index :subjects, [:group_id]
  end
end
