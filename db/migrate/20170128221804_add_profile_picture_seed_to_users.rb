class AddProfilePictureSeedToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :profile_picture_seed, :string
  end
end
