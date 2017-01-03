class Note < ApplicationRecord
  belongs_to :approver
  belongs_to :guardian
  belongs_to :recipient
end
