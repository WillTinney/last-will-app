class AddOwnerColumnToNotes < ActiveRecord::Migration[5.0]
  def change
    add_reference :notes, :owner, polymorphic: true
  end
end
