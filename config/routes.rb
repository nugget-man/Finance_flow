Financeflow2::Application.routes.draw do
  get 'finance/:id' => 'customers#currentstep', :as => 'finance'
  get 'step1/:id' => 'stepones#new', :as => 'step1'
  get 'step1/edit/:id' => 'stepones#edit', :as => 'step1edit'
  get 'step2/:id' => 'steptwos#new', :as => 'step2'
  get 'step2/edit/:id' => 'steptwos#edit', :as => 'step2edit'
  get 'step3/:id' => 'stepthrees#new', :as => 'step3'
  get 'step3/edit/:id' => 'stepthrees#edit', :as => 'step3edit'
  get 'step4/:id' => 'stepfours#new', :as => 'step4'
  get 'step4/edit/:id' => 'stepfours#edit', :as => 'step4edit'
  get 'step5/:id' => 'stepfives#new', :as => 'step5'
  get 'step5/edit/:id' => 'stepfives#edit', :as => 'step5edit'
  get 'step6/:id' => 'stepsixes#new', :as => 'step6'
  get 'step6/edit/:id' => 'stepsixes#edit', :as => 'step6edit'
  get 'step7/:id' => 'stepsevens#new', :as => 'step7'
  get 'step7/edit/:id' => 'stepsevens#edit', :as => 'step7edit'
  get 'step8/:id' => 'stepeights#new', :as => 'step8'
  get 'step8/edit/:id' => 'stepeights#edit', :as => 'step8edit'
  get 'step9/:id' => 'stepnines#new', :as => 'step9'
  get 'step9/edit/:id' => 'stepnines#edit', :as => 'step9edit'
  get 'step10/:id' => 'steptens#new', :as => 'step10'
  get 'step10/edit/:id' => 'steptens#edit', :as => 'step10edit'
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