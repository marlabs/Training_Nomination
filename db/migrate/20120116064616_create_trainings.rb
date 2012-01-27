class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.string :training_name
      t.string :training_id
      t.date :start_date
      t.string :trainer_name
      t.string :location
      t.string :trainer_email_id
      t.string :trainer_contact
      t.string :duration
      t.date :end_date

      t.timestamps
    end
  end
end
