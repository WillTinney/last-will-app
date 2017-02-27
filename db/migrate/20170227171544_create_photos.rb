class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :document
      t.string :title
      t.string :comments
      t.references :assignee, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
