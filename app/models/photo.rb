class Photo < ApplicationRecord
  belongs_to :user

  validates :title, presence: true

  has_attachment :photo
end
