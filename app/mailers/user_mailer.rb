class UserMailer < ActionMailer::Base
  default from: "lipsa.khuntia@marlabs.com"
  
  def approved_email(emaildatas)
      @emaildatas = emaildatas
           mail(:to => @emaildatas.employee.email_id,
             #   :cc => "mohammed.ali@marlabs.com",
                :subject => "Training Nomination Approved #{@emaildatas.training.training_name}-#{Date.current}")
  end
  
  def reject_email(emaildatas)
      @emaildatas = emaildatas
           mail(:to => @emaildatas.employee.email_id,
          # :cc => "mohammed.ali@marlabs.com",
           :subject => "Training Nomination Rejected #{@emaildatas.training.training_name}-#{Date.current}",
           :template_path => 'user_mailer',
           :template_name => 'reject_email_email')
  end
  
  def approved_email_byhr(emp)
    
  @emp=emp
  puts "entering mailer"
  mail(:to => @emp.employee.email_id,
      # :cc => "mohammed.ali@marlabs.com",
       :subject => "Training #{@emp.training.training_name } #{@emp.training.start_date }")
         
  end
  
  def trn_nominated_email_byemp(employee_emaildatas)
    @employee_emaildatas = employee_emaildatas 
           mail(:to => @employee_emaildatas.employee.email_id,
                :cc => @employee_emaildatas.employee.email_id,
                :subject => "#{@employee_emaildatas.employee.employee_name}- #{@employee_emaildatas.training.training_name}-#{Date.current}- For your Approval")
  end
end
