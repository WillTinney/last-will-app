class AddProofOfResidencyColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :proof_of_residency, :string
  end
end