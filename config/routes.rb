Roomcheck::Application.routes.draw do
  
  resources :check_item_templates
  
  match "check_item_templates_clone" => "check_item_templates#clone"
  post "check_list_clone" => "check_lists#clone"

  resources :results
  resources :check_lists
  resources :check_items

  root :to => 'check_lists#index'
 
end
