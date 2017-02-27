class CreateAssignees < ActiveRecord::Migration[5.0]
  def change
    create_table :assignees do |t|
      t.string :title
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :relationship
      t.string :citizenship
      t.string :date_of_birth
      t.string :email
      t.string :phone_number
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :country
      t.string :postcode
      t.string :profile_picture
      t.string :profile_picture_seed
      t.string :type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
