class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.integer :phone_number

      t.integer :account_id

      t.timestamps
    end
  end
end
