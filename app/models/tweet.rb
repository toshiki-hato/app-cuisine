class Tweet < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_many :comments
  has_many :likes
  mount_uploader :image, ImageUploader
  def self.search(search)
    return Tweet.all unless search
    Tweet.where('title LIKE(?)', "%#{search}%")
  end
end
