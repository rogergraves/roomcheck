Roomcheck::Application.routes.draw do
  
  resources :results
  
  # get "results/new"
  # get "results/create"
  # get "results/edit"
  # get "results/update"
  # get "results/destroy"
  # get "results/show"

  resources :check_lists, :only => [ :index, :new, :edit, :destroy ]
  resources :units, :only => [ :show, :new, :destroy ]
  resources :check_items, :only => [ :new, :edit, :destroy ]

  root :to => 'check_lists#index'
 
end
