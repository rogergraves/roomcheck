Roomcheck::Application.routes.draw do
  
  resources :results

  resources :check_lists, :only => [ :index, :new, :edit, :destroy, :show ]
  resources :units, :only => [ :show, :new, :destroy ]
  resources :check_items# :only => [ :new, :edit, :destroy ]

  root :to => 'check_lists#index'
 
end
