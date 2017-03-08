class Assignee < ApplicationRecord
  belongs_to :user

  has_many :notes, dependent: :destroy
  has_many :references, dependent: :destroy
  has_many :photos, dependent: :destroy

  has_attachment :profile_picture

  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :type, presence: true

  def full_name
    middle_name ? first_name + " " + middle_name + " " + last_name : first_name + " " + last_name
  end

  def name_surname
    first_name + " " + last_name
  end

  def details_completed?
    true if first_name && last_name && relationship && profile_picture && citizenship && date_of_birth && email && phone_number && address_line_1 && address_line_2 && city && postcode && country
  end

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
