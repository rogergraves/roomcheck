Roomcheck::Application.routes.draw do
  
  resources :results

  resources :check_lists, :only => [ :index, :new, :edit, :destroy, :show ]
  resources :check_items

  root :to => 'check_lists#index'
 
end
