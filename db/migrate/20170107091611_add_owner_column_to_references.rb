class AddOwnerColumnToReferences < ActiveRecord::Migration[5.0]
  def change
    add_reference :references, :reference_owner, polymorphic: true
  end
end
