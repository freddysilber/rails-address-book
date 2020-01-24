class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :name
      t.integer :contact_id
      t.integer :user_id
      t.integer :phone_number
      t.boolean :active
      t.string :account_type

      t.timestamps
    end
  end
end
