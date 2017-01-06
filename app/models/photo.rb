class Photo < ApplicationRecord
  belongs_to :photo_owner, polymorphic: true
  mount_uploader :url, PhotoUploader
end
