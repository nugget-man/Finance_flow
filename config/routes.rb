Financeflow2::Application.routes.draw do

  put 'timer/:id' => 'customers#timer_set', :as => 'timer_set'
  get 'financenext/:id' => 'customers#finance', :as => 'financenext'
  get 'finance/:id' => 'customers#currentstep', :as => 'finance'
  put 'details/:id' => 'customers#detail', :as => 'details'
  get 'step1/new/:id' => 'stepones#show', :as => 'step1show'
  get 'step1/:id' => 'stepones#new', :as => 'step1'
  get 'step1/edit/:id' => 'stepones#edit', :as => 'step1edit'
  get 'step2/new/:id' => 'steptwos#show', :as => 'step2show'
  get 'step2/:id' => 'steptwos#new', :as => 'step2'
  get 'step2/edit/:id' => 'steptwos#edit', :as => 'step2edit'
  get 'step3/new/:id' => 'stepthrees#show', :as => 'step3show'
  get 'step3/:id' => 'stepthrees#new', :as => 'step3'
  get 'step3/edit/:id' => 'stepthrees#edit', :as => 'step3edit'
  get 'step4/new/:id' => 'stepfours#show', :as => 'step4show'
  get 'step4/:id' => 'stepfours#new', :as => 'step4'
  get 'step4/edit/:id' => 'stepfours#edit', :as => 'step4edit'
  get 'step5/new/:id' => 'stepfives#show', :as => 'step5show'
  get 'step5/:id' => 'stepfives#new', :as => 'step5'
  get 'step5/edit/:id' => 'stepfives#edit', :as => 'step5edit'
  get 'step6/new/:id' => 'stepsixes#show', :as => 'step6show'
  get 'step6/:id' => 'stepsixes#new', :as => 'step6'
  get 'step6/edit/:id' => 'stepsixes#edit', :as => 'step6edit'
  get 'step7/new/:id' => 'stepsevens#show', :as => 'step7show'
  get 'step7/:id' => 'stepsevens#new', :as => 'step7'
  get 'step7/edit/:id' => 'stepsevens#edit', :as => 'step7edit'
  get 'step8/new/:id' => 'stepeights#show', :as => 'step8show'
  get 'step8/:id' => 'stepeights#new', :as => 'step8'
  get 'step8/edit/:id' => 'stepeights#edit', :as => 'step8edit'
  get 'step9/new/:id' => 'stepnines#show', :as => 'step9show'
  get 'step9/:id' => 'stepnines#new', :as => 'step9'
  get 'step9/edit/:id' => 'stepnines#edit', :as => 'step9edit'
  get 'step10/new/:id' => 'steptens#show', :as => 'step10show'
  get 'step10/:id' => 'steptens#new', :as => 'step10'
  get 'step10/edit/:id' => 'steptens#edit', :as => 'step10edit'
  get 'step11/new/:id' => 'stepelevens#show', :as => 'step11show'
  get 'step11/:id' => 'stepelevens#new', :as => 'step11'
  get 'step11/edit/:id' => 'stepelevens#edit', :as => 'step11edit'
  get 'step12/new/:id' => 'steptwelves#show', :as => 'step12show'
  get 'step12/:id' => 'steptwelves#new', :as => 'step12'
  get 'step12/edit/:id' => 'steptwelves#edit', :as => 'step12edit'
  get 'step13/new/:id' => 'stepthirteens#show', :as => 'step13show'
  get 'step13/:id' => 'stepthirteens#new', :as => 'step13'
  get 'step13/edit/:id' => 'stepthirteens#edit', :as => 'step13edit'
  get 'step14/new/:id' => 'stepfourteens#show', :as => 'step14show'
  get 'step14/:id' => 'stepfourteens#new', :as => 'step14'
  get 'step14/edit/:id' => 'stepfourteens#edit', :as => 'step14edit'
  get 'step15/new/:id' => 'stepfifteens#show', :as => 'step15show'
  get 'step15/:id' => 'stepfifteens#new', :as => 'step15'
  get 'step15/edit/:id' => 'stepfifteens#edit', :as => 'step15edit'
  resources :steptens
  resources :stepnines
  resources :stepeights
  resources :stepsevens
  resources :stepsixes
  resources :stepfives
  resources :stepfours
  resources :stepthrees
  resources :steptwos
  resources :stepones
  resources :stepfifteens
  resources :tickets
  resources :stepfourteens
  resources :stepthirteens
  resources :steptwelves
  resources :stepelevens
  devise_for :users#,  :controllers => { :registrations => "users/registrations" }
  match "/customers/add_new_comment" => "customers#add_new_comment", :as => "add_new_comment_to_customers", :via => [:post]
  get "remote/new"
  get "remote/back"
  get "remote/forward"
  get "remote/home"
  resources :customers do
    get :currentstep, :on => :member
    resources :comments
  end
  resources :comments, :path_prefix => '/:commentable_type/:commentable_id'
  root :to => "customers#index"
end