class Post < ApplicationRecord
  has_many :post_attachments
  accepts_nested_attributes_for :post_attachments

  validates :title, presence: true
  validates :body, presence: true
  validates :image, file_size: { less_than: 2.megabytes }
end
