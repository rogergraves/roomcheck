Roomcheck::Application.routes.draw do
  
  resources :results
  resources :check_lists
  resources :check_items

  root :to => 'check_lists#index'
 
end
