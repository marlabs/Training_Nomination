NominateTraining::Application.routes.draw do
  
  #----------------------------Employee Nominate Traiings ------------------------
  resources :employees
  resources :projects
  resources :skills
  
  get "nominate_trainee_details/new"
   match "/employee/show"=>"employee_trainings#show"  
  match "cancel" => "employee_trainings#cancel"
  match "trainings"=>"employee_trainings#trainings"
  match 'EmployeeTrainings' =>"EmployeeTrainings#index"
  get  'nominate' => "employee_trainings#nominate";
  match "search_nominee_employee_nomination"=>"employee_trainings#search_nominee_employee_nomination"
  
  root:to=>"EmployeeTrainings#index"
  #----------------------------End of Employee Nominate Traiings ------------------
  
  match 'ManagerApproval' => "ManagerApproval#index"   
  match 'ManagerApproval/approve' => 'ManagerApproval#approve'
  match 'ManagerApproval/reject' => 'ManagerApproval#reject'

  match 'NominateTraining' => "NominateTraining#index" 
  match 'NominateTraining/create' => "NominateTraining#create" 
  match 'NominateTraining/cancel' => "NominateTraining#cancel"
  match 'NominateTraining/search' => "NominateTraining#search"
  #match "search_nominee" => "nomineeDetails#search_nominee"


  #match "search_nomineedata"=>"nomineeDetails#search_nomineedata"
  match "employee_trainings" => "ManagerApproval#approve"
  
  
  match "search_nominee" => "nomineeDetails#search_nominee"
# match "search_nominee_details" => "nomineeDetails#search_nominee_details"

  match "search_nomineedata"=>"nomineeDetails#search_nomineedata"
  
   match "search_nominee_mail"=>"nomineeDetails#search_nominee_mail"
   match "search_nominee_summary"=>"nomineeDetails#search_nominee_summary"
  # match 'nominate' => 'employee_trainings#nominate', :via => :get 
  
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
