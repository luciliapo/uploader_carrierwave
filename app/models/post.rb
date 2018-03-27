class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :title, presence: true
  validates :body, presence: true
  validates :image, file_size: { less_than: 2.megabytes }
end
