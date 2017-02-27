class AddNumberOfGuardiansToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :number_of_guardians, :integer
  end
end
