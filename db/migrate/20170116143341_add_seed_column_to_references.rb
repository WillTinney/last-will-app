class AddSeedColumnToReferences < ActiveRecord::Migration[5.0]
  def change
    add_column :references, :document_seed, :string
  end
end
