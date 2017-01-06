class Approver < ApplicationRecord
  belongs_to :user
  has_many :notes, as: :note_owner
  has_many :photos, as: :photo_owner
end
