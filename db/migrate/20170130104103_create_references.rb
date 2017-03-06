class CreateReferences < ActiveRecord::Migration[5.0]
  def change
    create_table :references do |t|
      t.string :document
      t.string :title
      t.string :comments
      t.references :assignee, foreign_key: true
      t.references :user, foreign_key: true

      t.string :document_seed

      t.timestamps
    end
  end
end
