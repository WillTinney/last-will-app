class AddUserIdToAssignee < ActiveRecord::Migration[5.0]
  def change
    add_reference :assignees, :user, foreign_key: true
  end
end
