class AddOwnerColumnToNotes < ActiveRecord::Migration[5.0]
  def change
    add_reference :notes, :note_owner, polymorphic: true
  end
end
