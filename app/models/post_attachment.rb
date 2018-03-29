class PostAttachment < ApplicationRecord
  mount_uploader :attachments, ImageUploader
  belongs_to :post
end
