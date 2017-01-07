class Approver < ApplicationRecord
  belongs_to :user
  has_many :notes, as: :note_owner
  has_many :photos, as: :photo_owner
  has_many :references, as: :reference_owner
end
