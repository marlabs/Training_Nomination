class EmployeeTrainingsController < ApplicationController
  require 'date'
  require 'time'

  # GET /employee_trainings
  # GET /employee_trainings.json
  helper_method :sort_column
  
  def index
    @employee = Employee.find(1)
    @projects =Project.all
    @skills= Skill.all
    @employee_trainings = EmployeeTraining.all
    @trainings = Training.all
  end

  def search_nominee_employee_nomination
    skill = Skill.find(params[:skill_id])
    if params[:start_date]=="" && params[:end_date]==""
    @trainings = Training.find(:all,:conditions =>["training_name like ? ", "%#{skill.technologies}%"])
     elsif 
       @trainings = Training.find(:all,:conditions =>["training_name like ? and start_date >= ? ", "%#{skill.technologies}%",params[:start_date] ])
    elsif
     @trainings = Training.find(:all,:conditions =>["training_name like ? and start_date >= ? and end_date <= ? ", "%#{skill.technologies}%",params[:start_date], params[:end_date]])
    end
    respond_to do |format|
      format.html
    end
  end

  def nominate
    params[:employee_training_id].each do |training_id|
    @employee_training = EmployeeTraining.new(:training_id => training_id,:employee_id => 2,:status => 1) 
    @employee_training.save
    @employee_emaildatas=EmployeeTraining.get_emp_email_data(training_id)
    UserMailer.trn_nominated_email_byemp(@employee_emaildatas).deliver
    end
    flash.keep[:notice]="Your nomination request has send for Manager Review"
    redirect_to :controller=>'EmployeeTrainings',:action=>'index'
 
  end

  def cancel

    redirect_to :controller=>'EmployeeTrainings',:action=>'search_nominee_employee_nomination'
  end
  # StringBuffer b=new StringBuffer();
  # if(id!=null){
  #
  # b.append("where id?"+id);
  # }

  # GET /employee_trainings/1
  # GET /employee_trainings/1.json
  

end