class Proof < ApplicationRecord
  belongs_to :user

  has_attachment :document

  validates :title, presence: true
  validates :document, presence: true
end
