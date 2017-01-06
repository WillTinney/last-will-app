class CreateAdminRefs < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_refs do |t|
      t.string :title
      t.string :comments
      t.string :document

      t.timestamps
    end
  end
end
