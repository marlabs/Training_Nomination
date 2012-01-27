class CreateEmployeeTrainings < ActiveRecord::Migration
  def change
    create_table :employee_trainings do |t|
      t.integer :training_id
      t.integer :employee_id
      t.integer :status
      t.string :comments

      t.timestamps
    end
  end
end
