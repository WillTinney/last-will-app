class AddBasicDataColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :middle_name, :string
    add_column :users, :last_name, :string
    add_column :users, :citizenship, :string
    add_column :users, :date_of_birth, :string
    add_column :users, :phone_number, :string
    add_column :users, :address_line_1, :string
    add_column :users, :address_line_2, :string
    add_column :users, :town, :string
    add_column :users, :country, :string
    add_column :users, :postcode, :string
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
    add_column :users, :profile_picture, :string
    add_column :users, :gender, :string
  end
end
