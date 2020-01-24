class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :account_type
      t.boolean :active
      t.string :name
      t.integer :phone_number

      t.integer :user_id

      t.timestamps
    end
  end
end
