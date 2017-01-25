class CreateAssets < ActiveRecord::Migration[5.0]
  def change
    create_table :digital_assets do |t|
      t.string :title
      t.string :description
      t.string :asset
      t.string :type
      t.string :asset_seed
      t.references :user, foreign_key: true
      t.references :assignee, foreign_key: true

      t.timestamps
    end
  end
end
