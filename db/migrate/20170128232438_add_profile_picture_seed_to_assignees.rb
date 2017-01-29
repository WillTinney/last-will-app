class AddProfilePictureSeedToAssignees < ActiveRecord::Migration[5.0]
  def change
    add_column :assignees, :profile_picture_seed, :string, default: "user3.png"
  end
end
