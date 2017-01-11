class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attachment :proof_of_residency

  delegate :approvers, :guardians, :recipients, to: :assignees

  has_many :assignees, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :references, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_one :video, dependent: :destroy

  # Relationship Methods
  def show_partner
    recipients.where('relationship = ?', 'Partner')
  end

  def show_children
    recipients.where('relationship = ?', 'Child')
  end

  def show_other_family
  end

  def show_mother
    recipients.where('relationship = ?', 'Mother')
  end

  def show_friends
    recipients.where('relationship = ?', 'Friend')
  end
end
