class Reference < Asset
  belongs_to :user

  validates :title, presence: true

  has_attachment :document
end
