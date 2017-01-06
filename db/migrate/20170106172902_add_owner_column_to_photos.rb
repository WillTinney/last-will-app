class AddOwnerColumnToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_reference :photos, :photo_owner, polymorphic: true
  end
end
