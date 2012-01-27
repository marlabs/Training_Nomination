class Employee < ActiveRecord::Base
  has_many :employee_trainings, :foreign_key => "employee_id"
  
  def self.employee_details(employee_num)
    find(employee_num)
  end
  
end
