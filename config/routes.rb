Financeflow2::Application.routes.draw do
  resources :steptens

  resources :stepnines

  resources :stepeights

  resources :stepsevens

  resources :stepsixes

  resources :stepfives

  resources :stepfours

  resources :stepthrees

  resources :steptwos

  match 'finance/:id' => 'customers#currentstep', :as => 'finance'
  match 'step1/:id' => 'stepones#new', :as => 'step1'
  match 'step1/edit/:id' => 'stepones#edit', :as => 'step1edit'
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