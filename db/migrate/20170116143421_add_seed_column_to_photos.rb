class AddSeedColumnToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :photo_seed, :string
  end
end
