class AddUserIdToNotes < ActiveRecord::Migration[5.0]
  def change
    add_reference :notes, :user, foreign_key: true
  end
end
