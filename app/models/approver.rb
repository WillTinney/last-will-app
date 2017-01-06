class Approver < ApplicationRecord
  belongs_to :user
  has_many :notes, as: :owner
end
