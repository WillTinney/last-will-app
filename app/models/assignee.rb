class Assignee < ApplicationRecord
  belongs_to :user

  has_many :notes
  has_many :photos
  has_many :references

end
