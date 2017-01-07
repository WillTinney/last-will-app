class Reference < ApplicationRecord
  belongs_to :reference_owner, polymorphic: true

  validates :title, presence: true
  validates :document, presence: true

  has_attachment :document
end
