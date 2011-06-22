Financeflow2::Application.routes.draw do


  match 'finance/:id' => 'customers#currentstep', :as => 'finance'


  match 'step1/:id' => 'stepones#new', :as => 'step1'
  match 'step1/edit/:id' => 'stepones#edit', :as => 'step1edit'
  match 'step2/:id' => 'steptwos#new', :as => 'step2'
  match 'step2/edit/:id' => 'steptwos#edit', :as => 'step2edit'
  match 'step3/:id' => 'stepthrees#new', :as => 'step3'
  match 'step3/edit/:id' => 'stepthrees#edit', :as => 'step3edit'
  match 'step4/:id' => 'stepfours#new', :as => 'step4'
  match 'step4/edit/:id' => 'stepfours#edit', :as => 'step4edit'
  match 'step5/:id' => 'stepfives#new', :as => 'step5'
  match 'step5/edit/:id' => 'stepfives#edit', :as => 'step5edit'
  match 'step6/:id' => 'stepsixes#new', :as => 'step6'
  match 'step6/edit/:id' => 'stepsixes#edit', :as => 'step6edit'
  match 'step7/:id' => 'stepsevens#new', :as => 'step7'
  match 'step7/edit/:id' => 'stepsevens#edit', :as => 'step7edit'
  match 'step8/:id' => 'stepeights#new', :as => 'step8'
  match 'step8/edit/:id' => 'stepeights#edit', :as => 'step8edit'
  match 'step9/:id' => 'stepnines#new', :as => 'step9'
  match 'step9/edit/:id' => 'stepnines#edit', :as => 'step9edit'
  match 'step10/:id' => 'steptens#new', :as => 'step10'
  match 'step10/edit/:id' => 'steptens#edit', :as => 'step10edit'
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
  devise_for :users
  get "remote/new"
  get "remote/back"
  get "remote/forward"
  get "remote/home"
  resources :flowlists
  resources :customers do
    get :currentstep, :on => :member
  end
  resources :comments, :path_prefix => '/:commentable_type/:commentable_id'
  root :to => "customers#index"
end