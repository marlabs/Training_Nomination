class NomineeDetailsController < ApplicationController
  helper_method :sort_column, :sort_direction
  def search_nominee
  end

  def search_nomineedata
    @startdate=  params[:startDate] if !(params[:startDate].blank?)
     
 
     
     @enddate=  params[:endDate] if !(params[:endDate].blank?)
     @idvalue=  params[:trainining_id]
     @statusnotapproved=params[:statusnotapproved]
     puts @statusnotapproved
     @statusapproved=params[:statusapproved]
     puts @statusapproved
    
     @conditions='';
                      @conditions=          "select 
                                            emttring.id,
                                            
                                            emttring.status,
                                            empls.emp_number,
                                            empls.employee_name ,
                                            trngs.training_name,
                                            empls.manager_name,
                                            DATE_FORMAT(trngs.start_date,GET_FORMAT(DATE,'EUR')) as start_date,
                                            DATE_FORMAT(trngs.end_date,GET_FORMAT(DATE,'EUR')) as end_date,
                                            trngs.duration,
                                            trngs.location ,
                                            empls.project
                                            from
                                            employees empls,
                                            trainings trngs,
                                            employee_trainings emttring
                                            
                                            where empls.id=emttring.employee_id
                                            
                                            and trngs.id = emttring.training_id"
                                            
                          if !(params[:trainining_id].blank?)  
                            
                            @conditions << " and emttring.training_id= '#{@idvalue}'"    
                                       
                              end
                              
                              
                              if !(params[:statusapproved].blank? )  
                            if (@statusapproved!='undefined' && @statusnotapproved=='undefined')
                            @conditions << " and emttring.status= '#{@statusapproved}'"  
                            end  
                                       
                              end
                               if !(params[:statusnotapproved].blank? )  
                            if (@statusapproved=='undefined' && @statusnotapproved!='undefined')
                            @conditions << " and emttring.status= '#{@statusnotapproved}'"  
                            end  
                                       
                              end
                              
                              
                              
                               if !(params[:startDate].blank? )  
                          
                               @conditions << " and trngs.start_date >= '#{params[:startDate]}'"  
                          puts  @startdate
                                       
                              end
                               if !(params[:endDate].blank? )  
                            
                            @conditions << " and trngs.end_date <= '#{params[:endDate]}'"  
                    
                                       
                              end
                              
          @nominee_details=EmployeeTraining.find_by_sql(
                                            
                                            
                                            @conditions
                                            );                             
                                            
                                            
                         respond_to do |format|
                  
                  format.html{}
                  end
                                     
                                            
          end
         
         
       
         
         
         
         
          
           def search_nominee_mail
             if !(params[:employee_training_id].blank?)
               params[:employee_training_id].each do |emp_training|
                 @employee_traning = EmployeeTraining.find(emp_training)
                 
                 
                  UserMailer.approved_email_byhr(@employee_traning).deliver
                  
                 end
               end 
             
             
     

              render "search_nominee"    
  end
  def search_nominee_summary
    
    puts "entering search_nominee"
  @id=params[:employee_id]   
puts @id
    #@employeeIddialog=Employee.find(:all, :conditions =>["emp_number =? ",@id])
    #@employeeIddialog=Training.find(:all, :conditions =>["emp_number =? ",@id])
   # @employeeIddialog.each do |c|
  
 @employeeIddialogsummary=EmployeeTraining.find(:all, :conditions =>["id =? ",@id])
  #end
@employeeIddialogsummary.each do |c|
  puts "entering inside loop"
  puts c.comments
 end

    respond_to do |format|
                  
                  format.html{}
                  end 
    
  end
 
end
 
