class AddNumberOfChildrenToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :number_of_children, :integer
  end
end
