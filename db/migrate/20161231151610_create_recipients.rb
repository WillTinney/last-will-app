class CreateRecipients < ActiveRecord::Migration[5.0]
  def change
    create_table :recipients do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :citizenship
      t.date :date_of_birth
      t.string :phone_number
      t.string :address_line_1
      t.string :address_line_2
      t.string :town
      t.string :postcode
      t.string :relationship
      t.string :profile_picture
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
