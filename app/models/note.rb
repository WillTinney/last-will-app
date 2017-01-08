class Note < ApplicationRecord
  belongs_to :user
  belongs_to :note_owner, polymorphic: true
end
