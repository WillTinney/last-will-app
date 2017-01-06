class Note < ApplicationRecord
  belongs_to :owner, polymorphic: true
end
