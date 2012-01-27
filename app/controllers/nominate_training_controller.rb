class NominateTrainingController < ApplicationController
  

def index  
  
    @training = Training.new
    @training_data = Training.first
    puts @training_data
    
    
    
    if !(@training_data.blank?)
       training_data = Training.select("training_id").limit(1).order("id desc")
       @new_id  = 'TR' + (training_data[0][:training_id].split('TR')[1].to_i + 1).to_s
    else
       @new_id = 'TR1' 
    end
    
    
    
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @training }
    end
  
  
     
end 
         
        
         
  def create
    
    
    
    @training = Training.new do |y|
     y.training_name= params[:trainings][:training_name]
     y.training_id=params[:trainings][:training_id]
     y.start_date=params[:txtFromDate]
     puts params[:txtFromDate]
     y.end_date=params[:txtToDate]
     puts params[:txtToDate]
     y.trainer_name=params[:trainings][:training_name]
     y.location=params[:trainings][:location]
     y.trainer_email_id=params[:trainings][:trainer_email_id]
     y.trainer_contact=params[:trainings][:trainer_contact]
     y.duration=params[:trainings][:duration]
     
     end
     @training.save
    flash[:notice] = " New Training was created sucessfully "
    
    redirect_to :controller=>'NominateTraining',:action=>'index' 
  end
    
  def cancel
    
   redirect_to :controller=>'NominateTraining',:action=>'index'
   end
        
end
