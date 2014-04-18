class AddIndexToGroups < ActiveRecord::Migration
  def change
    add_index :groups, :name
    add_index :groups, :category
  end
end
