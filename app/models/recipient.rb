class Recipient < ApplicationRecord
  belongs_to :user
  has_many :notes
end
