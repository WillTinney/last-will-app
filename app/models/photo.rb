class Photo < ApplicationRecord
  belongs_to :photo_owner, polymorphic: true

  validates :title, presence: true
  validates :photo, presence: true

  mount_uploader :photo, PhotoUploader
end
