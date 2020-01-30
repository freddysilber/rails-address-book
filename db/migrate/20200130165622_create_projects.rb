class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.boolean :complete
      t.integer :account_id
      t.integer :owner

      t.timestamps
    end
  end
end
