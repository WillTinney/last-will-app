class Recipient < ApplicationRecord
  belongs_to :user

    def show_partner
    recipients.where(relationship: 'Partner')
  end

end
