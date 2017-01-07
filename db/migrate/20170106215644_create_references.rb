class CreateReferences < ActiveRecord::Migration[5.0]
  def change
    create_table :references do |t|
      t.string :title
      t.string :comments
      t.string :document

      t.timestamps
    end
  end
end
