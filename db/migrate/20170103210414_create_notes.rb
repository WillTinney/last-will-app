class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.string :content
      t.references :assignee, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
