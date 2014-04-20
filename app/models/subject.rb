class Subject < ActiveRecord::Base
  belongs_to :group
  default_scope -> { order('created_at DESC') }
  validates :group_id, presence: true
  validates :name, presence: true
  validates :photo, presence: true
end
