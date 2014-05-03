class Group < ActiveRecord::Base
  has_many :subjects, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true

  def self.get_recent
    self.all.limit(4)
  end

  def tweets
    Tweet.from_group(self)
  end

  def photos
    Photo.from_group(self)
  end
end
