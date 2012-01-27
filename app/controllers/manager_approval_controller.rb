class ManagerApprovalController < ApplicationController
  def index
    @employee_trainings = EmployeeTraining.get_employee_details
  end
  
  def approve
    params[:checkedids].each do |checkedid|
      @trainings = EmployeeTraining.update_employee_details(checkedid,2,params[:comments])   
      email_datas = EmployeeTraining.get_email_data(checkedid)  
      UserMailer.approved_email(email_datas).deliver 
              
     end
     flash[:notice] = "Selected request has sent for the HR review and you will be reciving email for the same."
     redirect_to(:controller => :ManagerApproval ,:action => :index)
  end

  def reject
    params[:checkedids].each do |checkedid|
      @trainings = EmployeeTraining.update_employee_details(checkedid,3,params[:comments])
      if @trainings==true
        email_datas = EmployeeTraining.get_email_data(checkedid)      
      UserMailer.reject_email(email_datas).deliver
     end
     flash[:notice] = "Selected request has been rejected and you will be reciving email for the same."
    end
    redirect_to(:controller => :ManagerApproval ,:action => :index)
  end
end
