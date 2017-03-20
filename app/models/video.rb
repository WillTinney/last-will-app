class Video < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  # validates :video, presence: true

  has_attachment :video
end
