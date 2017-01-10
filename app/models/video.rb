class Video < ApplicationRecord
  belongs_to :user

  has_attachment :video
end
