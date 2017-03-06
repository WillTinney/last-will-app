class CreateCallToActions < ActiveRecord::Migration[5.0]
  def change
    create_table :call_to_actions do |t|
      t.string :event
      t.string :event_type
      t.datetime :release_date
      t.boolean :approver_confirmation
      t.integer :approver_count
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
