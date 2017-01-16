class Photo < ApplicationRecord
  belongs_to :user
  belongs_to :photo_owner, polymorphic: true

  validates :title, presence: true

  has_attachment :photo
end
