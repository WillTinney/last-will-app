class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :guardians, dependent: :destroy
  has_many :approvers, dependent: :destroy
  has_many :recipients, dependent: :destroy

  # Notes Associations
  # has_many :notes, through: :note_owner, source: :approvers, source_type: "Note"
  # has_many :notes, through: :note_owner, source: :guardians, source_type: "Note"
  # has_many :notes, through: :note_owner, source: :recipients, source_type: "Note"
  # has_many :notes, through: :approvers, source: :note_owner, source_type: "Approver"
  # has_many :notes, through: :guardians, source: :note_owner, source_type: "Guardian"
  # has_many :notes, through: :recipients, source: :note_owner, source_type: "Recipient"

  # has_many :notes, through: :approvers, source: :note_owner, source_type: "Note"
  # has_many :notes, through: :guardians, source: :note_owner, source_type: "Note"
  # has_many :notes, through: :recipients, source: :note_owner, source_type: "Note"

  # # References Associations
  # has_many :references, through: :approvers, source: :reference_owner, source_type: "Reference"
  # has_many :references, through: :guardians, source: :reference_owner, source_type: "Reference"
  # has_many :references, through: :recipients, source: :reference_owner, source_type: "Reference"

  # # Photos Associations
  # has_many :photos, through: :approvers, source: :photo_owner, source_type: "Photo"
  # has_many :photos, through: :guardians, source: :photo_owner, source_type: "Photo"
  # has_many :photos, through: :recipients, source: :photo_owner, source_type: "Photo"

  # Relationship Methods

  def show_children
  end

  def show_other_family
  end

  def show_friends
  end
end
