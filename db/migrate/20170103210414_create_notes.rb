class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.string :caption
      t.references :approver, foreign_key: true
      t.references :guardian, foreign_key: true
      t.references :recipient, foreign_key: true

      t.timestamps
    end
  end
end
