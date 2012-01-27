class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :technologies
      t.integer :status

      t.timestamps
    end
  end
end
