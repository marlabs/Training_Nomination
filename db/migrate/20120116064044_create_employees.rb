class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :employee_name
      t.integer :emp_number
      t.string :project
      t.string :email_id
      t.string :skill
      t.date :start_date
      t.string :manager_name

      t.timestamps
    end
  end
end
