class AdminRef < ApplicationRecord
  belongs_to :admin_owner, polymorphic: true

  validates :title, presence: true
  validates :document, presence: true
end
