class EmployeeTraining < ActiveRecord::Base
  belongs_to :employee
  belongs_to :training
  
  def self.get_employee_details
    @trainings = find_by_sql("SELECT emp_trn.id,emp_trn.employee_id,emp.emp_number,emp.employee_name,trn.training_name,trn.start_date,trn.end_date,trn.duration,trn.location,
    emp_trn.status,emp.project FROM employees emp,trainings trn,employee_trainings emp_trn
    WHERE emp.id=emp_trn.employee_id AND trn.id=emp_trn.training_id  AND STATUS=1;")
  end

  def self.update_employee_details(checkedid,status,comments)
    @trainings = EmployeeTraining.find(checkedid)
    @trainings.update_attributes(:status => status,:comments => comments)
    return true;
  end
  
  def self.get_email_data(checkedid)
    @email_datas=EmployeeTraining.find(checkedid)
  end
  
  def self.get_emp_email_data(training_id)
    @employee_emaildatas=EmployeeTraining.find_by_sql("SELECT * FROM employee_trainings WHERE training_id=13;")
  end
end
