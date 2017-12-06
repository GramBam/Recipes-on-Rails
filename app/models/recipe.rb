class Recipe < ActiveRecord::Base
  belongs_to :chef
  has_many :likes
  validates :chef_id, presence: true
  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :summary, presence: true, length: { minimum: 8, maximum: 150 }
  validates :description, presence: true, length: { minimum: 15, maximum: 500 }
  mount_uploader :picture, PictureUploader
  validate :picture_size

  private

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
