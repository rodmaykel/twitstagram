class Photo < ActiveRecord::Base
  belongs_to :subject
  validates :subject_id, presence: true
  validates :photo, presence: true
  validates :instagram_id, presence: true
end
