class Reference < ApplicationRecord
  belongs_to :user
  belongs_to :reference_owner, polymorphic: true

  validates :title, presence: true

  has_attachment :document
end
