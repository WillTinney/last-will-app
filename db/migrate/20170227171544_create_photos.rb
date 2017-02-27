class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :photo
      t.string :title
      t.string :caption
      t.references :assignee, foreign_key: true
      t.references :user, foreign_key: true

      t.string :photo_seed

      t.timestamps
    end
  end
end
