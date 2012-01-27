class Training < ActiveRecord::Base
  has_many :employee_trainings, :foreign_key => "training_id"
end
