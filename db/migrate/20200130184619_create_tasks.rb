class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.boolean :complete
      t.integer :project_id
      t.string :status
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
