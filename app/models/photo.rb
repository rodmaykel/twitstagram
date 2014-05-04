class Photo < ActiveRecord::Base
  belongs_to :subject
  validates :subject_id, presence: true
  validates :photo, presence: true
  validates :instagram_id, presence: true

  def self.from_group(group) 
    subject_ids = group.subjects.map(&:id).join(',')
    where("subject_id IN (#{subject_ids})").order('created DESC');
    # TODO: need to optimize this
  end
end
