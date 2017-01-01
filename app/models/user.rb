class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :guardians, dependent: :destroy
  has_many :approvers, dependent: :destroy
  has_many :recipients, dependent: :destroy
end
