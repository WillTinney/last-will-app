class Assignee < ApplicationRecord
  belongs_to :user

  has_many :notes, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :references, dependent: :destroy

  def self.show_partner
    where('relationship = ?', 'Partner')
  end

  def self.show_children
    where('type = ? AND relationship = ?', 'Recipient', 'Child')
  end

  def self.show_other_family
    where('type = ? AND relationship != ? AND relationship != ? AND relationship != ?',
     'Recipient', 'Friend', 'Partner', 'Child')
  end

  def self.show_friends
    where('type = ? AND relationship = ?', 'Recipient', 'Friend')
  end
end
