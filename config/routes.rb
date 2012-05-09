Roomcheck::Application.routes.draw do
  
  get "photos/show"

  get "photos/create"

  get "photo/create"

  devise_for :users

  resources :check_item_templates do
    collection do
      put :reorder
    end
  end

#CHECKCHECK    We need to check the naming on the clone match and post.  
  match "check_item_templates_clone" => "check_item_templates#clone"
  post "check_list_clone" => "check_lists#clone"
  match "check_item_template" => "check_item_template#update"

  resources :results
  resources :check_lists
  resources :check_items
  
  match 'photo/:id' => "photos#create", :via => :post
  match 'photo/show' => "photos#show", :via => :get

  root :to => 'check_lists#index'
 
end
