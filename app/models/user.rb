class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_attachment :profile_picture

  has_many :assignees, dependent: :destroy
    has_many :guardians, dependent: :destroy
    has_many :recipients, dependent: :destroy
    has_many :approvers, dependent: :destroy
  has_many :proofs, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :references, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_one :call_to_action, dependent: :destroy

  # validates :email, uniqueness: true
  validates :title, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  accepts_nested_attributes_for :assignees

  def details_completed?
    true if first_name && last_name && profile_picture && citizenship && date_of_birth && email && phone_number && address_line_1 && address_line_2 && city && postcode && country
  end

  def full_name
    middle_name ? first_name + " " + middle_name + " " + last_name : first_name + " " + last_name
  end

  def name_surname
    first_name + " " + last_name
  end

  # Relationship Methods
  def partner
    recipients.where('relationship = ?', 'Partner').first
  end

  def children
    recipients.where('relationship = ?', 'Child')
  end

  def show_other
    recipients.where(['relationship != ? AND relationship != ?', 'Partner', 'Child'])
  end

  def show_other_family
    recipients.where('relationship != ? AND relationship != ? AND relationship != ?',
     'Friend', 'Partner', 'Child')
  end

  def show_mother
    recipients.where('relationship = ?', 'Mother')
  end

  def show_friends
    recipients.where('relationship = ?', 'Friend')
  end

  private

  # Data Unlock
  def self.send_unlock_email(user, recipients)
    UserMailer.unlock(user, recipients).deliver_now
  end

end
