class AddDataUnlockedToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :data_unlocked, :boolean, default: false
  end
end
